class CreateInvites < ActiveRecord::Migration[5.0]
  def change
    create_table :invites do |t|
      t.string :recipient_email, null: false
      t.references :group, foreign_key: true, index: true
      t.integer :sender_id, null: false
      t.string :recipient_id
      t.boolean :accepted, default: false
      t.string :token

      t.timestamps
    end

    add_foreign_key :invites, :users, column: :sender_id, index: true
    add_foreign_key :invites, :users, column: :recipient_id

    add_index :invites, :recipient_email
  end
end
