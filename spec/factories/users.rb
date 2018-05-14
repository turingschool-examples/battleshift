FactoryBot.define do
  factory :user do
    name "#{Faker::HarryPotter.character}"
    email 'test@test.com'
    password 'test'
    status 0
  end
end
