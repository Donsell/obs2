# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :telescope do
    user_id 1
    make "MyString"
    model "MyString"
    focal_length 1
    f_ratio 1.5
    diameter 1
  end
end
