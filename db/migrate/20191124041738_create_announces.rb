class CreateAnnounces < ActiveRecord::Migration[5.2]
  def change
    create_table :announces do |t|

      t.string :content
      # t.references :lop_hop, foreign_key: true
      # t.references :teacher, foreign_key: true
      t.timestamps
    end
  end
end
