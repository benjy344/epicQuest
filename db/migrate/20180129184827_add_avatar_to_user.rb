class AddAvatarToUser < ActiveRecord::Migration[5.1]
  def change
  	add_reference :users, :avatar, index: true, unique: true, foreign_key: true
  	add_reference :avatars, :user, index: true, unique: true, foreign_key: true
  end
end
