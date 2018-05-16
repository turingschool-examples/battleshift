class RemoveColumnsFromGames < ActiveRecord::Migration[5.1]
  def change
    remove_column :games, :player_1_board, :string
    remove_column :games, :player_2_board, :string
    remove_column :games, :player_1_turns, :integer
    remove_column :games, :player_2_turns, :integer
  end
end
