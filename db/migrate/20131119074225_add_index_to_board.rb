class AddIndexToBoard < ActiveRecord::Migration
  def change
    add_index :boards, :game_id
  end
end
