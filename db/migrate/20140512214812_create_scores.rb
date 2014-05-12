class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.references :game, index: true
      t.references :player, index: true
      t.integer :total

      t.timestamps
    end
  end
end
