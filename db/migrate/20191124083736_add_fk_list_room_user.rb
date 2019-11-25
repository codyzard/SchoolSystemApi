class AddFkListRoomUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :list_rooms, :user, foreign_key: true
  end
end
