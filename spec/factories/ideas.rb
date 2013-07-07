# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :idea do
    text { Faker::Lorem.paragraph }
    user
  end
end
