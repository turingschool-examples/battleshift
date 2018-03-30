class CreateGamePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :game_players do |t|
      t.references :game, foreign_key: true
      t.integer :player_1_id
      t.integer :player_2_id
    end
  end
end
