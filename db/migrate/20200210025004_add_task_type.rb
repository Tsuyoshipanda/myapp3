class AddTaskType < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :task_type, :string
  end
end
