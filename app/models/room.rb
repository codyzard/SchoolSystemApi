class Room < ApplicationRecord
    belongs_to :list_room
    has_many :messes
end
