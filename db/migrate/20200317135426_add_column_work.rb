class AddColumnWork < ActiveRecord::Migration[6.0]
  def change
    add_column :works, :post_id, :integer
    add_column :works, :user_id, :integer

  end
end
