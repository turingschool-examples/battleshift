class AddAuthenticatedToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :authenticated, :boolean, default: false
  end
end
