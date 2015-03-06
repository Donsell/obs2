# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :observation do
    user_id 1
    sesssion_id 1
    body_id 1
    obs_date "2014-09-11"
    obs_time "2014-09-11 20:54:14"
    seeing 1
    transparency 1
    telescope_id 1
    eyepiece_id 1
    filter_id 1
    note "MyText"
  end
end
