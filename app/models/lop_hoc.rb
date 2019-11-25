class LopHoc < ApplicationRecord
    belongs_to :grade
    belongs_to :teacher
    has_many :students
    has_many :announces
end
