class ChestInRoom < ApplicationRecord
	belongs_to :room
    belongs_to :chest
end
