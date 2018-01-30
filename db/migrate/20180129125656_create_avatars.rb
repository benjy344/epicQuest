class CreateAvatars < ActiveRecord::Migration[5.1]
  def change
    create_table :avatars do |t|
      t.string  :name,              null:    false
      t.integer :hp,                default: 20
      t.integer :level,             default: 1
      t.integer :exp,               default: 0
      t.integer :countUnlockDonjon, default: 1
      t.integer :history,           default: 0
      t.integer :maxHealth,         default: 20
      t.integer :strong,            default: 5
  	  t.integer :agility,           default: 5
      t.integer :id_sword
      t.integer :gold,              default: 0
      t.integer :id_shield
      t.integer :id_armor
      t.integer :nextLevel,         default: 50
    end
  end
end
