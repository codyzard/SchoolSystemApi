class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      
      t.integer :type #1 15, 2 45, 3CK
      t.float :score
      # t.references :score_arr, foreign_key: true

      t.timestamps
    end
  end
end
