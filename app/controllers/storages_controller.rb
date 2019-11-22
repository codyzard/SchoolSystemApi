class StoragesController < ApplicationController
  before_action :set_storage, only: [:show, :update, :destroy]

  # GET /storages
  def index
    @storages = Storage.all

    render json: @storages
  end

  # GET /storages/1
  def show
    render json: @storage
  end

  # POST /storages
  def create
    @storage = Storage.new(storage_params)

    if @storage.save
      render json: @storage, status: :created, location: @storage
    else
      render json: @storage.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /storages/1
  def update
    if @storage.update(storage_params)
      render json: @storage
    else
      render json: @storage.errors, status: :unprocessable_entity
    end
  end

  # DELETE /storages/1
  def destroy
    @storage.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_storage
      @storage = Storage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def storage_params
      params.fetch(:storage, {})
    end
end
