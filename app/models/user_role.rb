class UserRole < ApplicationRecord
    belongs_to :user
    has_one :teacher
    has_one :student
    has_one :parent
    validates :role, presence: true
end
