class AddTaskToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :task1, :text
  end
end
