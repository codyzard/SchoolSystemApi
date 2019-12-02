class ScoreArr < ApplicationRecord
    has_many :score
    belongs_to :subject
    belongs_to :student
end
