class AddNameToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :name, :string
  end
end
