class CreateShipsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :ships do |t|
      t.integer :damage
      t.integer :length
    end
  end
end
