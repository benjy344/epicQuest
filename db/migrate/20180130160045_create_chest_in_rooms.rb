class CreateChestInRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :chest_in_rooms do |t|
    	t.references :room, foreign_key: true
      	t.references :chest, foreign_key: true
    end
  end
end
