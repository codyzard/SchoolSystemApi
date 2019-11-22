class TeachStoragesController < ApplicationController
  before_action :set_teach_storage, only: [:show, :update, :destroy]

  # GET /teach_storages
  def index
    @teach_storages = TeachStorage.all

    render json: @teach_storages
  end

  # GET /teach_storages/1
  def show
    render json: @teach_storage
  end

  # POST /teach_storages
  def create
    @teach_storage = TeachStorage.new(teach_storage_params)

    if @teach_storage.save
      render json: @teach_storage, status: :created, location: @teach_storage
    else
      render json: @teach_storage.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teach_storages/1
  def update
    if @teach_storage.update(teach_storage_params)
      render json: @teach_storage
    else
      render json: @teach_storage.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teach_storages/1
  def destroy
    @teach_storage.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teach_storage
      @teach_storage = TeachStorage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def teach_storage_params
      params.fetch(:teach_storage, {})
    end
end
