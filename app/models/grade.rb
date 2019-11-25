class Grade < ApplicationRecord
    has_many :lessons
    has_many :lop_hocs
end
