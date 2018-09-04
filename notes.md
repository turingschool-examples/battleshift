class AddUsersToGame < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :users, :games, column: :player_1_id, primary_key: :id
    add_foreign_key :users, :games, column: :player_2_id, primary_key: :id
  end
end

User.create!(name: "andrew", email: "califormula@gmail.com", password: "1234", status: "active", auth_token: "UUEUmsTceaAkgDzYQfHdzrYb")
User.create(name: "keegan", email: "keegan.rw.corrigan@gmail.com", password: "1234", status: "active", auth_token: "fpFFK4XjbsCoWS7LmQ3q5CLr")

export BATTLESHIFT_BASE_URL='http://infinite-fjord-32357.herokuapp.com'
