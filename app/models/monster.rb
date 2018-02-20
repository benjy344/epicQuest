class Monster < ApplicationRecord
	has_many :monster_in_rooms
	has_many :rooms, through: :monster_in_rooms

  before_create :build_default_inventory

	has_one :inventory

  private
  def build_default_inventory
    build_inventory
    true
  end
end
