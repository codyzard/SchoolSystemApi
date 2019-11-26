class CreateUserRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_roles do |t|

      t.integer :role  #1 teacher, 2 student , 3 parent
      t.references :user, foreign_key: true
# 
      t.timestamps
    end
  end
end