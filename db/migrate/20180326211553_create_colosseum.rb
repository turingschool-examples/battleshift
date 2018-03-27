class CreateColosseum < ActiveRecord::Migration[5.1]
  def change
    create_table :colosseums do |t|
      t.references :user, foreign_key: true, type: :uuid
      t.references :game, foreign_key: true
      t.integer :gladiator_number

      t.timestamps
    end
  end
end
