FactoryBot.define do
  factory :user do
    username "#{{Faker::GameOfThrones.unique.house}}@gmail.com"
    first_name {Faker::Name.unique.first_name}
    last_name {Faker::Food.ingredient}
    api_key {Faker::Config.random.seed}
    password_digest "password"
  end
end
