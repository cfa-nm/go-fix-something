# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    idea
    text { Faker::Lorem.paragraph }
    author { idea.user }
  end
end
