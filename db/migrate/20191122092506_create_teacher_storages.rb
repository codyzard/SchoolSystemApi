class CreateTeacherStorages < ActiveRecord::Migration[5.2]
  def change
    create_table :teacher_storages do |t|

      #t.references :teacher, foreign_key: true
      #t.references :document, foreign_key: true

      t.timestamps
    end
  end
end
