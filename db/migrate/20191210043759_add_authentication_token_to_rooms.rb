class AddAuthenticationTokenToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :authentication_token, :string, limit: 20
    add_index :rooms, :authentication_token, unique: true
  end
end
