class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :status, default: 0
      t.string :api_key

      t.timestamps
    end
  end
end
