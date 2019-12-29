class CreateLopHocs < ActiveRecord::Migration[5.2]
  def change
    create_table :lop_hocs do |t|

      t.string :name
      t.boolean :lopChuyen, default: false
      # t.references :grade, foreign_key: true      
      # t.references :teacher, foreign_key: true      
      t.timestamps
    end
  end
end
