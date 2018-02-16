class Quest < ApplicationRecord
	has_many :quest_logs
	has_many :avatars, through: :quest_logs
end
