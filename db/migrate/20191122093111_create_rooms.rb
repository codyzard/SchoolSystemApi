class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|

      t.string :name
      #t.references :list_room, foreign_key: true
      #t.references :mess, foreign_key: true

      t.timestamps
    end
  end
end
