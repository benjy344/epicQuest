class CreatePockets < ActiveRecord::Migration[5.1]
  def change
    create_table :pockets do |t|
    	t.references :inventory, foreign_key: true
      	t.references :item, foreign_key: true
    end
  end
end
