class CreateScoreArrs < ActiveRecord::Migration[5.2]
  def change
    create_table :score_arrs do |t|
      
      # t.references :student, foreign_key: true
      # t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
