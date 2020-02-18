class AddTask4ToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :task4, :text
  end
end
