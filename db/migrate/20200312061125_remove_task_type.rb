class RemoveTaskType < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :task_type_1, :string
    remove_column :posts, :task_type_2, :string
    remove_column :posts, :task_type_3, :string
    remove_column :posts, :task_type_4, :string
    remove_column :posts, :task_type_5, :string
  end
end
