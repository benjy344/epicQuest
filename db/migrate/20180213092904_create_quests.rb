class CreateQuests < ActiveRecord::Migration[5.1]
  def change
    create_table :quests do |t|
    	t.string  :title,  null: false
    	t.string  :description,  null: false
    	t.integer :unlockLevel
    	t.boolean :done, default: false
    	t.string  :rewardType
    	t.integer :objetToFind
    	t.integer :reward
    end
  end
end
