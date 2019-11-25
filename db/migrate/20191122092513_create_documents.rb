class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|

      t.string :title
      t.string :docType
      t.string :content
      
      # t.references :subjects, foreign_key: true
      # t.references :storages, foreign_key: true

      t.timestamps
    end
  end
end
