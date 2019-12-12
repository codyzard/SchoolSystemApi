class ScoreArr < ApplicationRecord
    has_many :scores
    belongs_to :subject
    belongs_to :student
end
