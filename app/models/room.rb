class Room < ApplicationRecord
	has_many :room_in_donjons
	has_many :donjons, through: :room_in_donjons

	has_many :monster_in_rooms
	has_many :monsters, through: :monster_in_rooms

	has_many :chest_in_rooms
	has_many :chests, through: :chest_in_rooms
end
