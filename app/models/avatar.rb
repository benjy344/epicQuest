class Avatar < ApplicationRecord
	belongs_to :job, optional: true
	has_one :inventory
end
