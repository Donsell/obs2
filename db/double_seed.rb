Body.where("id > ?", 20000).destroy_all
#ActiveRecord::Base.connection.execute("TRUNCATE TABLE  constellations")
open ("public/data/doubles2.csv") do |bodies|
  bodies.read.each_line do |body|
    body_id,nameid, alt_name, catpos, ra, dec, constellation, comp, mag1, mag2, sep, angle, ur, sa2000, spec, year, ads, ngc = body.squeeze(" ").chomp.split(",")
    sec = (ra[6].to_i * 6).to_s
    ra.gsub!(/\s/ ,":")
    ra = "2000-01-01 " + ra.chop.chop + ":" + sec
    dec.gsub!(/\s/, ".")
#    if type.chr.to_i != 0  then
#      numstars = type.chr.to_i
#    end
#    type.sub!(/\d/, '#')
#    btype = BodyType.where(:abbr => type)
    cnst = Constellation.where(:abbr => constellation.humanize).limit(1)
    psa_page = psa(ra, dec)
    body = Body.find_or_create_by(
      :id => body_id,
      :name => nameid,
      :alt_name => alt_name,
      :body_type_id => 25,
      :constellation_id => cnst[0].id,
      :right_ascension => ra,
      :declination => dec,
      :magnitude => mag1,
      :surface_brightness => mag2,
      :uranometria => ur,
      :sky_atlas_2000 => sa2000,
      :pocket_sky_atlas => psa_page,
      :size_max => sep,
      :size_min => nil,
      :position_angle => angle,
      :class_id => spec,
      :number_of_stars => 0,
      :brightest_star_mag => 0,
      :ngc_description => ngc,
    )
    case catpos.to_i
      when 0
        load_body(nameid, body_id,1)
        load_body(alt_name,body_id,0) unless alt_name.blank?
      when 1
        load_body(nameid, body_id,0)
        load_body(alt_name,body_id,1) unless alt_name.blank?
      when 2
        Catalog.find_or_create_by(
          :catalog => nameid,
          :catalog_num => nil,
          :body_id => body.id)
          body_array = alt_name.split(';')
          load_body(body_array[0],body_id,1)
          load_body(body_array[1],body_id,0)
    end
  end
end