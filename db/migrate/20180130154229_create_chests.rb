class CreateChests < ActiveRecord::Migration[5.1]
  def change
    create_table :chests do |t|
    	t.integer :gold
    end
  end
end
