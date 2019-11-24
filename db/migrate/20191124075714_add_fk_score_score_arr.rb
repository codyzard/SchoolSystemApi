class AddFkScoreScoreArr < ActiveRecord::Migration[5.2]
  def change
    add_reference :scores, :score_arr, foreign_key: true
  end
end
