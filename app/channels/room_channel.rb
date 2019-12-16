class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def create params
    @user = User.find_by(authentication_token: params["token_user"] )
    @room = Room.find_by(authentication_token: params["token_room"])
    if @user
      mess = @user.messes.create!(content: params["content"], room_id: @room.id, user_token: @user.authentication_token)
    else
      render status: 204
    end
  end
end
