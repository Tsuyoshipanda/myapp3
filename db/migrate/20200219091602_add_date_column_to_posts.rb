class AddDateColumnToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :deadline, :date
  end
end
