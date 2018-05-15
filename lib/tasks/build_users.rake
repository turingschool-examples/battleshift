namespace :build do

  desc 'create users'
  task users: :environment do
    user1 = User.create!(name: 'thrasher', email: 'test1@test.com', password: 'player_1', status: 'active')
    puts "Created #{user1.name} with ID: #{user1.id}"
    user2 = User.create!(name: 'fluffy', email: 'test2@test.com', password: 'player_2', status: 'active')
    puts "Created #{user2.name} with ID: #{user2.id}"
  end
end
