class AddTask3ToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :task3, :text
  end
end
