class CreateActivationKey < ActiveRecord::Migration[5.1]
  def change
    create_table :activation_keys do |t|
      t.references :user
      t.string :activation_key
    end
  end
end
