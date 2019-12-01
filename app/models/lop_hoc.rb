class LopHoc < ApplicationRecord
    belongs_to :grade
    has_and_belongs_to_many :teachers
    has_many :students
    has_many :announces
end
