class CreateBalls < ActiveRecord::Migration
  def change
    create_table :balls do |t|
      t.integer :pins_knocked1
      t.integer :pins_knocked2
      t.references :frame, index: true
      t.references :player, index: true

      t.timestamps
    end
  end
end
