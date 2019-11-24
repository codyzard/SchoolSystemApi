class AddFkParentUserRole < ActiveRecord::Migration[5.2]
  def change
    add_reference :parents, :user_role, foreign_key: true
  end
end
