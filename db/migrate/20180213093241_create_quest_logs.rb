class CreateQuestLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :quest_logs do |t|
		t.references :avatar, foreign_key: true
      	t.references :quest, foreign_key: true
      	t.string     :state, default: 'locked'
    end
  end
end
