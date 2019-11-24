class AddFkScoreArrStudent < ActiveRecord::Migration[5.2]
  def change
    add_reference :score_arrs, :student, foreign_key: true
  end
end
