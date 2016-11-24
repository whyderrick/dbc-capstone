class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.references :walks, foreign_key: true
      t.string :reported_party #This is set when someone files a report to the other person on their walk
      t.text :details
      t.boolean :follow_up

      t.timestamps
    end
  end
end
