class AddInventoryToAvatar < ActiveRecord::Migration[5.1]
  def change
  	add_reference :inventories, :avatar, index: true, unique: true, foreign_key: true
  	add_reference :avatars, :inventory, index: true, unique: true, foreign_key: true
  end
end
