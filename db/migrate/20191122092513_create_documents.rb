class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|

      t.string :name
      t.string :docType
      t.string :content
      # t.datetime :dateCreate


      t.timestamps
    end
  end
end
