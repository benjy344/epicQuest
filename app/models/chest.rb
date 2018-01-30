class Chest < ApplicationRecord
	has_many :item_in_chests
  	has_many :items, through: :item_in_chests

  	has_many :chest_in_rooms
	has_many :rooms, through: :chest_in_rooms
end
