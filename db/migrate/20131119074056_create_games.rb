class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name, null: false
      t.string :opponent, null: false
      t.string :opponent_url, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
