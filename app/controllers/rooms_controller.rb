class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :update, :destroy]
  before_action :find_user, only: [:index]
  # GET /rooms
  def index
    # @rooms = Room.all
    @rooms = @user.rooms
    @lastMessArr = getLastMess(@rooms)
    render json: {rooms: @rooms, lastMessArr: @lastMessArr }
  end

  def getLastMess rooms
    arr =[]
    rooms.each_with_index do |room, index|
      m = Mess.where(room_id:room.id).last
      if (m != nil)
        arr << m
      else
        arr << " "
      end
    end
    return arr
  end
  # GET /rooms/1
  def show
    render json: @room
  end

  # POST /rooms
  def create
    @room = Room.new(room_params)

    if @room.save
      render json: @room, status: :created, location: @room
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rooms/1
  def update
    if @room.update(room_params)
      render json: @room
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rooms/1
  def destroy
    @room.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def room_params
      params.fetch(:room, {})
    end

    def find_user
      @user = User.find_by(authentication_token: params[:authentication_token])     
    end
end
