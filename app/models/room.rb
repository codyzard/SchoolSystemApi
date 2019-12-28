class Room < ApplicationRecord
    acts_as_token_authenticatable
    has_many :room_users
    has_many :users, through: :room_users, dependent: :destroy
    has_many :messes, dependent: :destroy
end
