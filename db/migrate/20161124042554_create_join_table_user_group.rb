class CreateJoinTableUserGroup < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :groups do |t|
    	t.string 	:rating #check this, are we setting rating as string or boolean
    	t.boolean :admin

      t.index :user_id
      t.index :group_id
    end
  end
end
