class CreateJoinTableUserGroup < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :groups do |t|
    	t.boolean :admin

      t.index :user_id
      t.index :group_id
    end
  end
end
