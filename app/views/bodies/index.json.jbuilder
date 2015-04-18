json.array!(@bodies) do |body|
  json.extract! body, :id, :name, :alt_name, :body_type_id, :constellation_is, :right_ascenstion, :declination, :surface_brightness, :uranometria, :sky_atlas_2000, :pocket_sky_atlas, :size_max, :size_min, :position_angle, :class_id, :number_of_stars, :brightest_star_mag, :ngc_description
  json.url body_url(body, format: :json)
end
