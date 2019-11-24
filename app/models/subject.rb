class Subject < ApplicationRecord
    has_many :teachers
    has_many :lessons
    has_many :score_arrs
    has_many :documents
end
