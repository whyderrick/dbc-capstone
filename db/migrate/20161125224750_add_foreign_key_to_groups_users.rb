class AddForeignKeyToGroupsUsers < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :groups_users, :users, column: :member_id
  end
end
