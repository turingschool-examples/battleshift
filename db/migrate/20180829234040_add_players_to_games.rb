class AddPlayersToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :challenger_token, :string
    add_column :games, :opponent_token, :string
  end
end
