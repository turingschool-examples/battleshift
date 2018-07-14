class CreateBoardTable < ActiveRecord::Migration[5.1]
  def change
    create_table :boards do |t|
      t.boolean :active
      t.references :user, foreign_key: true, index: true
      t.references :game, foreign_key: true, index: true
    end
  end
end
