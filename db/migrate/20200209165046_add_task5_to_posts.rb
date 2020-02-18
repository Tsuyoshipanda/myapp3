class AddTask5ToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :task5, :text
  end
end
