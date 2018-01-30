class Recipe < ApplicationRecord
	belongs_to :item
	has_many   :ingredients
	has_many   :items, through: :ingredients
end
