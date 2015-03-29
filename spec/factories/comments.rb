FactoryGirl.define do
  factory :comment do
    commenter Faker::Internet.user_name
    content Faker::Lorem.sentence
  end
end
