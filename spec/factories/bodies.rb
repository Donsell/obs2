# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :body do
    body_id "MyText"
    alt_id "MyText"
    body_type ""
    constellation nil
    right_ascenstion "2014-08-26 14:19:11"
    declination 1.5
    surface_brightness 1.5
    uranometria 1
    sky_atlas_2000 1
    pocket_sky_atlas 1
    size_max 1.5
    size_min 1.5
    position_angle 1
    class_id "MyText"
    number_of_stars 1
    brightest_star_mag 1.5
    ngc_description "MyString"
  end
end
