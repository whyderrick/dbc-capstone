class AddWalkRefToChatrooms < ActiveRecord::Migration[5.0]
  def change
    add_reference :chatrooms, :walk, foreign_key: true
  end
end
