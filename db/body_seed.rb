BodyType.delete_all
#ActiveRecord::Base.connection.execute("TRUNCATE TABLE  body_types")
open ("public/data/object_types.csv") do |types|
  types.read.each_line do |type|
    bodytype_id, abbr, name = type.chomp.split(",")
    BodyType.find_or_create_by(:id => bodytype_id, :abbr => abbr, :description => name)
  end
end
Body.where("id < ?", 20000).destroy_all
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
