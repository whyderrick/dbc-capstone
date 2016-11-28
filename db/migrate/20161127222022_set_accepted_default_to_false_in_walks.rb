class SetAcceptedDefaultToFalseInWalks < ActiveRecord::Migration[5.0]
  def change
    change_column_default :walks, :accepted, false
  end
end
