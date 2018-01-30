class AddJobToAvatar < ActiveRecord::Migration[5.1]
  def change
  	add_reference :avatars, :job, foreign_key: true
  end
end
