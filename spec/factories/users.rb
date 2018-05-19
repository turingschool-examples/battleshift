FactoryBot.define do
  factory :user, class: User do
    name 'Burbot'
    email 'burbotsrevenge@yahoo.com'
    activated true
    password 'hayheyatthebay'
    api_key '45DDE$RTTW//=='
  end

  factory :user_2, class: User do
    name 'Burbot'
    email 'burbotsrevenge2@yahoo.com'
    activated true
    password 'hayheyatthebay'
    api_key '45DDE$RTTW//=1'
  end

  factory :unregistered_user, class: User do
    name 'Captain Morgan'
    email 'CaptainMorgansRevenge@comcast.net'
    activated false
    password 'blobbloblchickenflob'
  end
end
