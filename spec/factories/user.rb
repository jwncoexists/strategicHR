FactoryGirl.define do
  factory :user do
    last_name "User"
    first_name "Test"
    account "member"
    password "letmein"
    password_confirmation "letmein"
    email "test@example.com"
    confirmed_at Time.now
  end
end