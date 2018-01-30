class ItemInChest < ApplicationRecord
	belongs_to :item
    belongs_to :chest
end
