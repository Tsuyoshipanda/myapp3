class AddColumnWorkCount < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :work_count, :integer
  end
end
