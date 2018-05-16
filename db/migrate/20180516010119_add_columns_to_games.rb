class AddColumnsToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :player_1, :text
    add_column :games, :player_2, :text
  end
end
