class DropJoinTableGroupsUsers < ActiveRecord::Migration[5.0]
  def change
    drop_table :groups_users
  end
end
