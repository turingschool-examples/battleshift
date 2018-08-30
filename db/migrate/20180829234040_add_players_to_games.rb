class AddPlayersToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :player_1_token, :string
    add_column :games, :player_2_token, :string
  end
end
