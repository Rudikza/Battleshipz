class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.text :grid, null: false
      t.integer :game_id

      t.timestamps
    end
  end
end
