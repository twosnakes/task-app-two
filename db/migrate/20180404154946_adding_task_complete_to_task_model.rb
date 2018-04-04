class AddingTaskCompleteToTaskModel < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :task_complete, :boolean, default: false
  end
end
