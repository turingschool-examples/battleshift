FactoryBot.define do
  factory :user, class: User do
    sequence(:name) { |n| "User #{n}" }
    sequence(:email) { |n| "foo#{n}@foo.com" }
    password "password"
    password_confirmation "password"
    api_key ENV["BATTLESHIFT_API_KEY"]
  end

  factory :activated_user, class: User do
    sequence(:name) { |n| "User #{n}" }
    sequence(:email) { |n| "foo#{n}@foo.com" }
    password "password"
    password_confirmation "password"
    activated true
    api_key ENV["BATTLESHIFT_API_KEY"]
  end
end
