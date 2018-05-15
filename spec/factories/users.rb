FactoryBot.define do
  factory :user, class: User do
    name 'Burbot'
    email 'burbotsrevenge@yahoo.com'
    activated true
    password 'hayheyatthebay'
    api_key '45DDE$RTTW//=='
  end

  factory :unregistered_user, class: User do
    name 'Captain Morgan'
    email 'CaptainMorgansRevenge@comcast.net'
    activated false
    password 'blobbloblchickenflob'
  end
end
