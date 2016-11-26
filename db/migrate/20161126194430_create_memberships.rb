class CreateMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :memberships do |t|
      t.integer :member_id
      t.integer :group_id, foreign_key: true
      t.boolean :admin

      t.timestamps
    end

    add_foreign_key :memberships, :users, column: :member_id
    add_foreign_key :memberships, :groups, column: :group_id
    add_index :memberships, :member_id
    add_index :memberships, :group_id
  end
end
