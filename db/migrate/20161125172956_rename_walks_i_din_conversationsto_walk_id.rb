class RenameWalksIDinConversationstoWalkId < ActiveRecord::Migration[5.0]
  def change
    rename_column :conversations, :walks_id, :walk_id
  end
end
