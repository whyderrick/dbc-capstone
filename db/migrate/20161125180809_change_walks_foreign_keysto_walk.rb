class ChangeWalksForeignKeystoWalk < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :conversations, :walks
    add_foreign_key :conversations, :walks, column: :walk_id

    remove_column :reports, :walks_id
    add_reference :reports, :walk, foreign_key: true

  end
end
