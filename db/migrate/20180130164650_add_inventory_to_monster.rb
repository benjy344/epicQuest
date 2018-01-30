class AddInventoryToMonster < ActiveRecord::Migration[5.1]
  def change
  	add_reference :inventories, :monster, index: true, unique: true, foreign_key: true
  	add_reference :monsters, :inventory, index: true, unique: true, foreign_key: true
  end
end
