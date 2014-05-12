class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :surname
      t.references :game, index: true

      t.timestamps
    end
  end
end
