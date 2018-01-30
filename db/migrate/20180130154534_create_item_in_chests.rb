class CreateItemInChests < ActiveRecord::Migration[5.1]
  def change
    create_table :item_in_chests do |t|
    	t.references :chest, foreign_key: true
      	t.references :item, foreign_key: true
    end
  end
end
