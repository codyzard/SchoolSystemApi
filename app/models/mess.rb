class Mess < ApplicationRecord
    belongs_to :user, dependent: :destroy
    belongs_to :room, dependent: :destroy
    after_create_commit do
        SendMessCreationEventBroadcastJob.perform_later(self)
    end
end
