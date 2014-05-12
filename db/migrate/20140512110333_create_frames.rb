class CreateFrames < ActiveRecord::Migration
  def change
    create_table :frames do |t|
      t.references :game, index: true

      t.timestamps
    end
  end
end
