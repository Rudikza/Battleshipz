class LastPlayerAttackToGame < ActiveRecord::Migration
  def change
     add_column :games, :last_player_attack, :text
  end
end
