class AddDescriptiontoGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :description, :text
  end
end