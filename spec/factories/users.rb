FactoryBot.define do
  factory :user do
    name 'Burbot'
    email 'burbotsrevenge@yahoo.com'
    activated true
    password 'hayheyatthebay'
  end

  factory :unregistered_user do
    name 'Captain Morgan'
    email 'CaptainMorgansRevenge@comcast.net'
    activated false
    password 'blobbloblchickenflob'
  end
end
