class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.string :msg
      t.integer :user_id
      t.references :walks, foreign_key: true

      t.timestamps
    end
  end
end
