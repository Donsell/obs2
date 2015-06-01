# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#user = CreateAdminService.new.call
#puts 'CREATED ADMIN USER: ' << user.email

Constellation.delete_all
#ActiveRecord::Base.connection.execute("TRUNCATE TABLE  constellations")
open ("public/data/constellations.csv") do |constellations|
  constellations.read.each_line do |constellation|
    constellation_id, abbr, name, genitive = constellation.chomp.split(",")
    Constellation.find_or_create_by(:id => constellation_id, :abbr => abbr.humanize, :constellation => name.humanize, :genitive => genitive.humanize)
  end
end

BodyType.delete_all
#ActiveRecord::Base.connection.execute("TRUNCATE TABLE  body_types")
open ("public/data/object_types.csv") do |types|
  types.read.each_line do |type|
    bodytype_id, abbr, name = type.chomp.split(",")
    BodyType.find_or_create_by(:id => bodytype_id, :abbr => abbr, :description => name)
  end
end
Body.delete_all
Catalog.delete_all
#ActiveRecord::Base.connection.execute("TRUNCATE TABLE  bodies")
#ActiveRecord::Base.connection.execute("TRUNCATE TABLE  catalogs")
open ("public/data/bodies.csv") do |bodies|
  bodies.read.each_line do |body|
    body_id,nameid, alt_name, type, constellation, ra, dec, mag, sb, ur, sa2000, max, min, angle, class_id, numstars, bs, bchm, ngc = body.squeeze(" ").chomp.split(",")
    sec = (ra[6].to_i * 6).to_s
    ra.gsub!(/\s/ ,":")
    ra = "2000-01-01 " + ra.chop.chop + ":" + sec
    dec.gsub!(/\s/, ".")
    if type.chr.to_i != 0  then
      numstars = type.chr.to_i
    end
    type.sub!(/\d/, '#')
    btype = BodyType.where(:abbr => type)
    cnst = Constellation.where(:abbr => constellation.humanize)
    psa_page = psa(ra, dec)
    body = Body.find_or_create_by(
     	:id => body_id,
      :name => nameid,
      :alt_name => alt_name,
      :body_type_id => btype.first.id,
      :constellation_id => cnst.first.id,
      :right_ascension => ra,
      :declination => dec,
      :magnitude => mag,
      :surface_brightness => sb,
      :uranometria => ur,
      :sky_atlas_2000 => sa2000,
      :pocket_sky_atlas => psa_page,
      :size_max => max,
      :size_min => min,
      :position_angle => angle,
      :class_id => class_id,
      :number_of_stars => numstars,
      :brightest_star_mag => bs,
      :ngc_description => ngc,
    )
    body_array = nameid.split(';')
    body_array.each do |entry|
      entry.squeeze!(" ")
      entry.sub!("V V", "VV")
      entry.sub!("- ", "-")
      entry.sub!("- ", "-")
      entry.sub!(". ", ".")
      entry.sub!(". ", ".")
      entry.sub!("Sh2-", "Sh2 ")
      entry_array = entry.split
      Catalog.find_or_create_by(
        :catalog => entry_array[0],
        :catalog_num => entry_array[1],
        :body_id => body.id,
      )
    end
    body_array = alt_name.split(';')
    body_array.each do |entry|
      entry.squeeze!(" ")
      entry.sub!("V V", "VV")
      entry.sub!("- ", "-")
      entry.sub!("- ", "-")
      entry.sub!("- ", "-")
      entry.sub!(". ", ".")
      entry.sub!("Sh2-", "Sh2 ")
      entry_array = entry.split
      if entry_array.length > 1
        Catalog.find_or_create_by(
          :catalog => entry_array[0],
          :catalog_num => entry_array[1],
          :body_id => body.id,
        )
      end
    end
  end
end

# Load ProgramsBodies
ProgramBody.delete_all
#ActiveRecord::Base.connection.execute("TRUNCATE TABLE  program_bodies")
bodies = Catalog.where(catalog: "M").order(:catalog_num)
bodies.each do |body|
  ProgramBody.find_or_create_by(:program_id => 1, :body_id => body.id, :name => body.catalog + ("000" + body.catalog_num).split(//).last(3).join)
end

open ("public/data/Hearsch.csv") do |herschs|
  herschs.read.each_line do |hersch|
    body = Catalog.where(catalog: "NGC", catalog_num: hersch.chomp).limit(1)
    ProgramBody.find_or_create_by(:program_id => 2, :body_id => body[0].id, :name => body[0].catalog + ("0000" + body[0].catalog_num).split(//).last(4).join)
  end
end
#=end
def psa(ra, dec)
  ra_dec = ra.to_time.hour + (ra.to_time.min/60)
  case ra.to_time.hour
  when 0..2
    base_page = 1
    median = 1.5
  when 3..5
    base_page = 11
    median = 4.5
  when 6..8
    base_page = 21
    median = 7.5
  when 9..11
    base_page = 31
    median = 9.5
  when 12..14
    base_page = 41
    median = 13.5
  when 15..17
    base_page = 51
    median = 16.5
  when 18..20
    base_page = 61
    median = 19.5
  when 21..23
    base_page = 71
    median = 22.5
  end

  case dec.to_f
  when -89.99..-60.0
    psa_page = base_page + 9
  when -60.00..-30.0
    if ra_dec < median
      psa_page = base_page + 8
    else
      psa_page = base_page + 7
    end
  when -30.0..0.0
    if ra_dec < median + 0.33
      psa_page = base_page + 6
    else
      psa_page = base_page + 5
    end
  when 0.0..30.0
    if ra_dec < median + 0.33
      psa_page = base_page + 4
    else
      psa_page = base_page + 3
    end
  when 30.0..60.0
    if ra_dec < median + 0.33
      psa_page = base_page + 2
    else
      psa_page = base_page + 1
    end
  else
    psa_page = base_page
  end
end

 