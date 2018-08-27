class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :password_digest
      t.string :user_token
      t.integer :status, default: 0
    end
    add_index :users, :user_token, unique: true
  end
end
