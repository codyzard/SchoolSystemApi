class ScoreArrsController < ApplicationController
  before_action :set_score_arr, only: [:show, :update, :destroy]

  # GET /score_arrs
  def index
    @score_arrs = ScoreArr.all

    render json: @score_arrs
  end

  # GET /score_arrs/1
  def show
    render json: @score_arr
  end

  # POST /score_arrs
  def create
    @score_arr = ScoreArr.new(score_arr_params)

    if @score_arr.save
      render json: @score_arr, status: :created, location: @score_arr
    else
      render json: @score_arr.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /score_arrs/1
  def update
    if @score_arr.update(score_arr_params)
      render json: @score_arr
    else
      render json: @score_arr.errors, status: :unprocessable_entity
    end
  end

  # DELETE /score_arrs/1
  def destroy
    @score_arr.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_score_arr
      @score_arr = ScoreArr.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def score_arr_params
      params.fetch(:score_arr, {})
    end
end
