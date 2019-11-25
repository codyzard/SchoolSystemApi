class Lesson < ApplicationRecord
    belongs_to :teacher
    belongs_to :grade
    belongs_to :subject
end
