class AddTaskAndDeadlineAndTaskYpe < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :task, :text
    add_column :posts, :task_type, :string
    add_column :posts, :deadline, :date

  end
end
