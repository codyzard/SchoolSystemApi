class AddFkRoomListRoom < ActiveRecord::Migration[5.2]
  def change
    add_reference :rooms, :list_room, foreign_key: true
  end
end
