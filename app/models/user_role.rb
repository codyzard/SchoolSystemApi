class UserRole < ApplicationRecord
    belongs_to :user
    # has_one :teacher # co van de` quan he o day
end
