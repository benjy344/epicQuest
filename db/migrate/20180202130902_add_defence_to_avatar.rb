class AddDefenceToAvatar < ActiveRecord::Migration[5.1]
  def change
    add_column :avatars, :defence, :integer, default: 5
  end
end
