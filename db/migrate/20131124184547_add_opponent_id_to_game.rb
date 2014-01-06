class AddOpponentIdToGame < ActiveRecord::Migration
  def change
    add_column :games, :opponent_id, :integer, unique: true
  end
end
