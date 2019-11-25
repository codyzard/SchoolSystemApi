class AddFkScoreArrSubject < ActiveRecord::Migration[5.2]
  def change
    add_reference :score_arrs, :subject, foreign_key: true
  end
end
