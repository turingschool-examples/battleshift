class ChangeUsersTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :password, :password_digest
    add_column :users, :is_activated?, :boolean, default: false
  end
end
