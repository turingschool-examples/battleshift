FactoryBot.define do
  factory :user do
    name "Burbot"
    email "burbotsrevenge@yahoo.com"
  end

  factory :unregistered_user do
    name 'Captain Morgan'
    email 'CaptainMorgansRevenge@comcast.net'

  end
end
