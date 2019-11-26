class Student < ApplicationRecord
    has_many :score_arrs
    belongs_to :user
    belongs_to :parent
    belongs_to :lop_hoc
    belongs_to :user_role
end
