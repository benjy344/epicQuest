class Donjon < ApplicationRecord
	has_many :room_in_donjons
	has_many :rooms, through: :room_in_donjons
end
