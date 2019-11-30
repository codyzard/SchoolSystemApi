class CreateLopHocsTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :lop_hocs_teachers do |t|
      t.references :lop_hoc, foreign_key: true
      t.references :teacher, foreign_key: true
    end
  end
end
