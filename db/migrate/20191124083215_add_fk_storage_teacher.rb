class AddFkStorageTeacher < ActiveRecord::Migration[5.2]
  def change
    add_reference :storages, :teacher, foreign_key: true
  end
end
