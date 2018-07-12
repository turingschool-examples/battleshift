class AddUserToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :player_1_id, :integer
    add_index :games, :player_1_id
    add_column :games, :player_2_id, :integer
    add_index :games, :player_2_id
  end
end
