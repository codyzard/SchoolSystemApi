class AddUserTokenToMess < ActiveRecord::Migration[5.2]
  def change
    add_column :messes, :user_token, :string
  end
end
