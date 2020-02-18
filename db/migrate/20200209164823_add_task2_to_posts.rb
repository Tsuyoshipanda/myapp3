class AddTask2ToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :task2, :text
  end
end
