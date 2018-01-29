class CreateAvatars < ActiveRecord::Migration[5.1]
  def change
    create_table :avatars do |t|
      t.string  :name,  null: false
      t.integer :hp , default: 20
      t.integer :level, default: 1
      t.integer :exp, default: 0
      t.integer :countUnlockDonjon, default: 1
      t.integer :history, default: 0
      t.integer :MaxHealth, default: 20
      t.integer :force, default: 5
  	  t.integer :agility, default: 5
  	  t.integer :inteligence, default: 5
    end
  end
end
