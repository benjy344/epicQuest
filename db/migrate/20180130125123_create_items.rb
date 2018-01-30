class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string     :name
      t.string     :description
      t.integer    :rarity,      default: 0
      t.integer    :health,      default: 0
      t.integer    :force,       default: 0
      t.integer    :agility,     default: 0
      t.integer    :price,       default: 0
      t.integer    :defence,     default: 0
    end
  end
end
