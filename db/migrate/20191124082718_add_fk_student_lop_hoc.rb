class AddFkStudentLopHoc < ActiveRecord::Migration[5.2]
  def change
    add_reference :students, :lop_hoc, foreign_key: true
  end
end
