class CreateWalks < ActiveRecord::Migration[5.0]
  def change
    create_table :walks do |t|
      t.string :starting_location
      t.integer :walk_time
      t.boolean :accepted

      t.integer :requester_id
      t.integer :guardian_id

      t.timestamps
    end

    add_foreign_key :walks, :users, column: :requester_id
    add_foreign_key :walks, :users, column: :guardian_id
  end
end
