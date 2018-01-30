class CreateRoomInDonjons < ActiveRecord::Migration[5.1]
  def change
    create_table :room_in_donjons do |t|
    	t.references :room, foreign_key: true
        t.references :donjon, foreign_key: true
    end
  end
end
