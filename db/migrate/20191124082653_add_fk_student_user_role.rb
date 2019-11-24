class AddFkStudentUserRole < ActiveRecord::Migration[5.2]
  def change
    add_reference :students, :user_role, foreign_key: true
  end
end
