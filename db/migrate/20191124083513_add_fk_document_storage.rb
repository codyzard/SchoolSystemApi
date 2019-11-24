class AddFkDocumentStorage < ActiveRecord::Migration[5.2]
  def change
    add_reference :documents, :storage, foreign_key: true
  end
end
