class CreateTimeEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :time_entries do |t|
      t.references :task, null: false, foreign_key: true
      t.datetime :clock_out

      t.timestamps
    end
  end
end
