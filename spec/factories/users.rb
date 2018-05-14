FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "User #{n}" }
    sequence(:email) { |n| "foo#{n}@foo.com" }
    password "password"
    password_confirmation "password"
  end

  factory :activated_user do
    sequence(:name) { |n| "User #{n}" }
    sequence(:email) { |n| "foo#{n}@foo.com" }
    password "password"
    password_confirmation "password"
    activated true
  end
end
