class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|

      t.boolean :admin, default: false
      
      t.references :user_role, foreign_key: true
      # t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
