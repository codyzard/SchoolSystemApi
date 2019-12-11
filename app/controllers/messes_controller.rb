class MessesController < ApplicationController
  before_action :set_mess, only: [:show, :update, :destroy]

  # GET /messes
  def index
    # @room = Room.find_by(id: param[:id])
    @messes = Mess.all

    render json: @messes
  end

  # GET /messes/1
  def show
    render json: @mess
  end

  # POST /messes
  def create
    @mess = Mess.new(mess_params)

    if @mess.save
      render json: @mess, status: :created, location: @mess
    else
      render json: @mess.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /messes/1
  def update
    if @mess.update(mess_params)
      render json: @mess
    else
      render json: @mess.errors, status: :unprocessable_entity
    end
  end

  # DELETE /messes/1
  def destroy
    @mess.destroy
  end
  
  def getMessInRoom
    @room = Room.find_by(id: params[:room_id])
    @messes = Mess.where(room_id: @room.id)
    render json: {messes: @messes.as_json(except: [:user_id]), token_room: @room.authentication_token}
  end

  def getSendPerson
    @user = User.find_by(authentication_token: params[:user_token])
    render json: @user, only: [:name]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mess
      @mess = Mess.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def mess_params
      params.fetch(:mess, {})
    end
end
