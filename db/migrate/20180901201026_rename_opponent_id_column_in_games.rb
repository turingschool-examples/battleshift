class RenameOpponentIdColumnInGames < ActiveRecord::Migration[5.1]
  def change
    rename_column :games, :opponent_id, :opponent_key
  end
end
