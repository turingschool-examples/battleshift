FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "user-#{n}" }
    sequence(:email)    { |n| "email#{n}@email.com" }
    password 'password'
  end
end
