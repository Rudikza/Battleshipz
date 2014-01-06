class AddOpponentShipsSankToGame < ActiveRecord::Migration
  def change
    add_column :games, :opponent_ships_sank, :text
  end
end
