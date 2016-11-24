class RenameUserIDinGroupsUserstoMemberId < ActiveRecord::Migration[5.0]
  def change
    rename_column :groups_users, :user_id, :member_id
  end
end
