class Parent < ApplicationRecord
    has_many :students
    belongs_to :user_role
    belongs_to :user
end
