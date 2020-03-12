class RemoveTaskAndDeadline < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :task1, :text
    remove_column :posts, :task2, :text
    remove_column :posts, :task3, :text
    remove_column :posts, :task4, :text
    remove_column :posts, :task5, :text
    remove_column :posts, :deadline_1, :date
    remove_column :posts, :deadline_2, :date
    remove_column :posts, :deadline_3, :date
    remove_column :posts, :deadline_4, :date
    remove_column :posts, :deadline_5, :date

    end
end
