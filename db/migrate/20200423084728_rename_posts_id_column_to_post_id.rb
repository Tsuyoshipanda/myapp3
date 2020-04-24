class RenamePostsIdColumnToPostId < ActiveRecord::Migration[6.0]
  def change
    rename_column :messages, :posts_id, :post_id
  end
end
