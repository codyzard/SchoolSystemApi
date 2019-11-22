class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|

      #t.references :parent, foreign_key:true
      #t.references :lop_hoc, foreign_key:true
      #t.references :user_role, foreign_key: true
      
      t.timestamps
    end
  end
end
