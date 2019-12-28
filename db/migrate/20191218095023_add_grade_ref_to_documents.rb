class AddGradeRefToDocuments < ActiveRecord::Migration[5.2]
  def change
    add_reference :documents, :grade, foreign_key: true
  end
end
