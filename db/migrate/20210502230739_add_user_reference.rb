class AddUserReference < ActiveRecord::Migration[6.1]
  def change
    add_reference :time_entries, :user, foreign_key: true, null: false
  end
end
