class AddFkSubjectTeacher < ActiveRecord::Migration[5.2]
  def change
    add_reference :teachers, :subject, foreign_key: true
  end
end
