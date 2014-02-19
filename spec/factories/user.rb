FactoryGirl.define do
  factory :user do
    last_name "User"
    first_name "Test"
    account "member"
    password "letmein"
    password_confirmation "letmein"
    email { "#{first_name}.#{last_name}@example.com".downcase }
    confirmed_at Time.now
  end
end