class RemoveTaskReference < ActiveRecord::Migration[6.1]
  def change
    remove_column :time_entries, :task_id
  end
end
