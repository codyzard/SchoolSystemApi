class AddFkAnnouceTeacher < ActiveRecord::Migration[5.2]
  def change
    add_reference :announces, :teacher, foreign_key: true
  end
end
