class SendMessCreationEventBroadcastJob < ApplicationJob 
    queue_as :default
    def perform(chat_message)
        @user = User.find_by(authentication_token: chat_message.user_token)
        ActionCable
          .server
          .broadcast('room_channel',
                     id: chat_message.id,
                     user_token: chat_message.user_token,
                     room_id: chat_message.room_id,
                     personSend: @user.name,
                     created_at: chat_message.created_at,
                     content: chat_message.content)
    end
end