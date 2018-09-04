class AddColumnToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :opponent_sunk_counter, :integer, default: 0
  end
end
