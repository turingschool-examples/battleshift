class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string            :username
      t.string            :first_name
      t.string            :last_name
      t.string            :api_key
      t.string            :password_digest
      t.boolean           :activated, default: false
      t.boolean           :playing, default: false

      t.timestamps
    end
  end
end
