class AddGameUsersJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :games do |t|
      t.references :user, foreign_key: true
      t.references :game, foreign_key: true
    end
  end
end
