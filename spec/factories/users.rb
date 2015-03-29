FactoryGirl.define do
  factory :user do
    user_name "Collin"
    password "test_pass"
    password_confirmation "test_pass"
    password_digest User.digest("test_pass")
  end
end
