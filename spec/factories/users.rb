FactoryGirl.define do
  factory :user do
    user_name Faker::Internet.user_name
    password Faker::Internet.password
  end
end
