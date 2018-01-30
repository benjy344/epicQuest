class Inventory < ApplicationRecord
	has_many :pockets
	has_many :items, through: :pockets
end
