class AddDefaultTurnToGame < ActiveRecord::Migration[5.1]
  def change
    change_column_default :games, :current_turn, 0
  end
end
