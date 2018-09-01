class AddUsersToGame < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :users, :games, column: :player_1_id, primary_key: :id
    add_foreign_key :users, :games, column: :player_2_id, primary_key: :id
  end
end
