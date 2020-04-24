class Association < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :message_id, :integer
    add_column :messages, :user_id, :integer
  end
end
