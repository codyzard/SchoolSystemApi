class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :update, :destroy, :student_detail]

  def student_detail
    @parent = Parent.find(@student.parent_id)
    @parent_user = User.find(UserRole.find(@parent.user_role_id).user_id)
    @user_role = UserRole.find(@student.user_role_id)
    @user = User.find(@user_role.user_id)
    @params = {mssv: @student.id, name: @user.name, parent:@parent_user.name, address: @user.address}
    render json: @params
  end

  # GET /students
  def index
    @students = Student.all
    @paramss = []
    @students.each {|s| 
      @parent = Parent.find(s.parent_id)
      @parent_user = User.find(UserRole.find(@parent.user_role_id).user_id)
      @user_role = UserRole.find(s.user_role_id)
      @user = User.find(@user_role.user_id)
      @params = {mssv: s.id, name: @user.name, parent:@parent_user.name, address: @user.address}
      @paramss.push(@params)}
    render json: @paramss
  end

  # GET /students/1
  def show
    render json: @student
  end

  # POST /students
  def create
    @student = Student.new(student_params)

    if @student.save
      render json: @student, status: :created, location: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /students/1
  def update
    if @student.update(student_params)
      render json: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # DELETE /students/1
  def destroy
    @student.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def student_params
      params.fetch(:student, {})
    end
end
