class Mess < ApplicationRecord
    belongs_to :user
    belongs_to :room
    after_create_commit do
        SendMessCreationEventBroadcastJob.perform_later(self)
        
    end
end
