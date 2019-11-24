class Teacher < ApplicationRecord
    belongs_to :user_role
    belongs_to :subject
    has_many :lessons
    has_many :lop_hocs
    has_many :storages
    has_many :announces
end
