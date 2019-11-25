class Student < User
    has_many :score_arrs
    belongs_to :user
    belongs_to :parent
    belongs_to :lop_hoc
end
