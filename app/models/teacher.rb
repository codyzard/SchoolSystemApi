class Teacher < ApplicationRecord
    # attribute :admin
    # attr_accessor :admin
    has_one :subject
    belongs_to :user_role
    has_many :lessons
    has_and_belongs_to_many :lop_hocs
    has_many :announces
    has_many :documents
end
