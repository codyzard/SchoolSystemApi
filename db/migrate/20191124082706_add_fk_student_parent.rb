class AddFkStudentParent < ActiveRecord::Migration[5.2]
  def change
    add_reference :score_arrs, :parent, foreign_key: true
  end
end
