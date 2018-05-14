class AddActivatedAndActivationKeyToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :activated, :boolean
    add_column :users, :activation_key, :string
  end
end
