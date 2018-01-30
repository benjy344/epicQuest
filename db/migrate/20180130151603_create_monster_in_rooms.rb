class CreateMonsterInRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :monster_in_rooms do |t|
    	t.references :room, foreign_key: true
      	t.references :monster, foreign_key: true
    end
  end
end
