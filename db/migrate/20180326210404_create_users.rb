class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, id: :uuid do |t|
      t.text :name
      t.text :email
      t.text :password_digest

      t.timestamps
    end
  end
end
