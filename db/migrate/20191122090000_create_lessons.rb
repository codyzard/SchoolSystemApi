class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|

      t.string :name
      t.string :description
      t.string :fileName
      # t.references :teacher, foreign_key: true
      # t.references :grade, foreign_key: true
      # t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
