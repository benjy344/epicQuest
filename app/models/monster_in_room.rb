class MonsterInRoom < ApplicationRecord
	belongs_to :room
    belongs_to :monster
end
