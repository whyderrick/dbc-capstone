class AddDestinationToWalks < ActiveRecord::Migration[5.0]
  def change
    add_column :walks, :destination, :string
  end
end
