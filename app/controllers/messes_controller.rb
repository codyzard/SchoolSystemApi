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
    @messes = Mess.where(room_id: params[:room_id])
    render json:  @messes, except: [:user_id]
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
