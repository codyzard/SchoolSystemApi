class CreateStorages < ActiveRecord::Migration[5.2]
  def change
    create_table :storages do |t|

      #t.references :teacher_storage, foreign_key: true

      t.timestamps
    end
  end
end
