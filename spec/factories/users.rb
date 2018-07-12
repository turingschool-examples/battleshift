FactoryBot.define do
  factory :user do
    first_name {Faker::Name.unique.first_name}
    last_name {Faker::Food.ingredient}
    username { "#{first_name}.#{last_name}@example.com".downcase }
    api_key User.generate_api_key
    password_digest "password"
    activated true
  end
end
