class CreateUserTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :user_tokens do |t|
      t.integer :user_id
      t.string :token

      t.timestamps
    end
  end
end
