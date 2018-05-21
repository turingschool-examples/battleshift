class AddPlayerBoardsToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :player_1_board, :text
    add_column :games, :player_2_board, :text
  end
end
