class LastOpponentAttackToGame < ActiveRecord::Migration
  def change
     add_column :games, :last_opponent_attack, :text
  end
end
