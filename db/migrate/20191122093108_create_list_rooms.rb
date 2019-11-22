class CreateListRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :list_rooms do |t|

      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
