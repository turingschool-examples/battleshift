class RemoveActivationKeyfromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :activation_key
  end
end
