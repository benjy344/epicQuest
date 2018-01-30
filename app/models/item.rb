class Item < ApplicationRecord
	has_one :recipe

	has_many :ingredients
  	has_many :recipes, through: :ingredients

  	has_many :item_in_chests
	has_many :chests, through: :item_in_chests

	has_many :pockets
	has_many :inventories, through: :pockets
end
