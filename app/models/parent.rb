class Parent < User
    has_many :students
    belongs_to :user
end
