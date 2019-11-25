class AddFkLopHocGrade < ActiveRecord::Migration[5.2]
  def change
    add_reference :lop_hocs, :grade, foreign_key: true
  end
end
