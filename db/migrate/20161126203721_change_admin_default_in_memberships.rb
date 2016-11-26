class ChangeAdminDefaultInMemberships < ActiveRecord::Migration[5.0]
  def change
    change_column_default :memberships, :admin, false
  end
end
