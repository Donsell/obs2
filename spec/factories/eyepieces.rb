# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :eyepiece do
    user_id 1
    make "MyString"
    model "MyString"
    focal_length 1
    afov 1
  end
end
