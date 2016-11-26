class ChangeWalkTimeTypeInWalks < ActiveRecord::Migration[5.0]
  def change
    remove_column :walks, :walk_time
    add_column :walks, :walk_time, :datetime
  end
end
