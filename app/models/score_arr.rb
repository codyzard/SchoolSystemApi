class ScoreArr < ApplicationRecord
    has_many :score
    belongs_to :subjects
    belongs_to :students
end
