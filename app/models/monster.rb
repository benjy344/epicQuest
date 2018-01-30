class Monster < ApplicationRecord
	has_many :monster_in_rooms
	has_many :rooms, through: :monster_in_rooms

	has_one :inventory
end
