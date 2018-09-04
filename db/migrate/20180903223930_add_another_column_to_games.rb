class AddAnotherColumnToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :player_sunk_counter, :integer, default: 0
  end
end
