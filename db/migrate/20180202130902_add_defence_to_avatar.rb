class AddDefenceToAvatar < ActiveRecord::Migration[5.1]
  def change
    add_column :avatars, :defence, :integer
  end
end
