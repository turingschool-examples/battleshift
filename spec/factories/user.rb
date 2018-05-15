FactoryBot.define do
  factory :user do
    name 'RBG'
    password_digest 'kween'
    email 'fake@example.com'
    status 'active'
  end
end
