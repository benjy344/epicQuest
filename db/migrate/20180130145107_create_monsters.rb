class CreateMonsters < ActiveRecord::Migration[5.1]
  def change
    create_table :monsters do |t|
    	t.string  :name
    	t.integer :hp
    	t.integer :strong
    	t.integer :agility
    	t.integer :exp
    	t.integer :defence
    	t.integer :gold
    end
  end
end
