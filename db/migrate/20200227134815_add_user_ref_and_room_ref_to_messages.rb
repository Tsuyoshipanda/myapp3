class AddUserRefAndRoomRefToMessages < ActiveRecord::Migration[6.0]
  def change
    add_reference :chats, :user, foreign_key: true
    add_reference :chats, :room, foreign_key: true
    change_column_null :chats, :user_id, false
    change_column_null :chats, :room_id, false
  end
end
