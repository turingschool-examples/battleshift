class AddPlayerAuthtoGame < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :player_1_auth_token, :string
    add_column :games, :player_2_auth_token, :string
  end
end
