FactoryBot.define do
  factory :user do
    name "#{Faker::HarryPotter.character}"
    sequence(:email) { |email| "#{email}#{Faker::Internet.email}"}
    password 'test'
    status 0
    api_key SecureRandom.urlsafe_base64
  end
end
