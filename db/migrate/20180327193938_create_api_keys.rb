class CreateApiKeys < ActiveRecord::Migration[5.1]
  def change
    create_table :api_keys do |t|
      t.references :user
      t.string :api_key
      t.timestamps
    end
  end
end
