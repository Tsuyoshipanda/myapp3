class AddTaskTypeAndDeadline < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :task_type_1, :string
    add_column :posts, :task_type_2, :string
    add_column :posts, :task_type_3, :string
    add_column :posts, :task_type_4, :string
    add_column :posts, :task_type_5, :string
  end
end
