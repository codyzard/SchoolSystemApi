class AddFkGradeLesson < ActiveRecord::Migration[5.2]
  def change
    add_reference :lessons, :grade, foreign_key: true
  end
end
