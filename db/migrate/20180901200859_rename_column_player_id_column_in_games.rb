class RenameColumnPlayerIdColumnInGames < ActiveRecord::Migration[5.1]
  def change
    rename_column :games, :player_id, :player_key
  end
end
