FactoryBot.define do
  factory :user do
    username {Faker::Name.unique}
    first_name {Faker::Name.unique.first_name}
    last_name {Faker::Food.ingredient}
    api_key User.generate_api_key
    password_digest "password"
  end
end
