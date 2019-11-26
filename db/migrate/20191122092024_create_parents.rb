class CreateParents < ActiveRecord::Migration[5.2]
  def change
    create_table :parents do |t|

      t.references :user_role, foreign_key: true
# 
      t.timestamps
    end
  end
end
