class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def create params
    @user = User.find(authentication_token: params[:token] )
    if @user && @user === current_user
      @user.mess.create(content: params[:content], room_id: params[:room_id])
    else
      render status: 204
    end
  end
end
