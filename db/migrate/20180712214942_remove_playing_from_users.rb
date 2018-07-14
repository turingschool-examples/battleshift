class RemovePlayingFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :playing, :boolean
  end
end
