class ListRoomsController < ApplicationController
  before_action :set_list_room, only: [:show, :update, :destroy]

  # GET /list_rooms
  def index
    @list_rooms = ListRoom.all

    render json: @list_rooms
  end

  # GET /list_rooms/1
  def show
    render json: @list_room
  end

  # POST /list_rooms
  def create
    @list_room = ListRoom.new(list_room_params)

    if @list_room.save
      render json: @list_room, status: :created, location: @list_room
    else
      render json: @list_room.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /list_rooms/1
  def update
    if @list_room.update(list_room_params)
      render json: @list_room
    else
      render json: @list_room.errors, status: :unprocessable_entity
    end
  end

  # DELETE /list_rooms/1
  def destroy
    @list_room.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list_room
      @list_room = ListRoom.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def list_room_params
      params.fetch(:list_room, {})
    end
end
