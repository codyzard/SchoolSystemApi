class AddFkMessUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :messes, :user, foreign_key: true
  end
end
