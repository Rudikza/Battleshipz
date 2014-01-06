class AddPrizeToGame < ActiveRecord::Migration
  def change
    add_column :games, :prize, :text
  end
end
