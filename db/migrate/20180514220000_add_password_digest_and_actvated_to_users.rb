class AddPasswordDigestAndActvatedToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :password_digest, :string
    add_column :users, :activated, :boolean
  end
end
