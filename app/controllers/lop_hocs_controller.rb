class LopHocsController < ApplicationController
  before_action :set_lop_hoc, only: [:show, :update, :destroy]

  # GET /lop_hocs
  def index
    @lop_hocs = LopHoc.all

    render json: @lop_hocs
  end

  # GET /lop_hocs/1
  def show
    render json: @lop_hoc
  end

  # POST /lop_hocs
  def create
    @lop_hoc = LopHoc.new(lop_hoc_params)

    if @lop_hoc.save
      render json: @lop_hoc, status: :created, location: @lop_hoc
    else
      render json: @lop_hoc.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lop_hocs/1
  def update
    if @lop_hoc.update(lop_hoc_params)
      render json: @lop_hoc
    else
      render json: @lop_hoc.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lop_hocs/1
  def destroy
    @lop_hoc.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lop_hoc
      @lop_hoc = LopHoc.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def lop_hoc_params
      params.fetch(:lop_hoc, {})
    end
end
