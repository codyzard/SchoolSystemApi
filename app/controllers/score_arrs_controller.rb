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

  def update_student_score
    @score_arr = ScoreArr.where(student_id: params[:id_student], subject_id: params[:id_subject])
    @student = Student.find(params[:id_student]);
    @subject = Subject.find(params[:id_subject])
    @user_role = UserRole.find(@student.user_role_id);
    @user = User.find(@user_role.user_id)
    @score_detail_arr = params[:score_arr]
    @score_arr.first.scores.each_with_index do |s,index| 
      s.score = @score_detail_arr[index]
      s.save
    end
    # byebug
    @score_arr.second.scores.each_with_index do |s,index|
      s.score = @score_detail_arr[index+4] 
      s.save
    end
    # byebug
    if @score_arr && @subject && @user
      render json: {mssv: @student.id, name: @user.name, HK1: @score_arr.first.scores, HK2: @score_arr.second.scores, subject: @subject}
    else
      render status: 404
    end
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
