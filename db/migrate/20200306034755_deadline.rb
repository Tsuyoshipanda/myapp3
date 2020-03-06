class Deadline < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :deadline_1, :date
    add_column :posts, :deadline_2, :date
    add_column :posts, :deadline_3, :date
    add_column :posts, :deadline_4, :date
    add_column :posts, :deadline_5, :date

  end
end
