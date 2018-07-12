class ChangeGames < ActiveRecord::Migration[5.1]
  def change
    remove_column :games, :player_1_board, :text
    remove_column :games, :player_2_board, :text
    add_column :games, :player_1_id, :integer
    add_column :games, :player_2_id, :integer
  end
end
