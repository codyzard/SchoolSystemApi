class AddFkDocumentSubject < ActiveRecord::Migration[5.2]
  def change
    add_reference :documents, :subject, foreign_key: true
  end
end
