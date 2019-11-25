class AddFkAnnouceLopHoc < ActiveRecord::Migration[5.2]
  def change
    add_reference :announces, :lop_hoc, foreign_key: true
  end
end
