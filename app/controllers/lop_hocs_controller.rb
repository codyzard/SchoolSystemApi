class LopHocsController < ApplicationController
  before_action :set_lop_hoc, only: [:show, :update, :destroy]

  def all_student_info
    @students = Student.where(lop_hoc_id: params[:id_class])
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

  def all_student_score
    @students = Student.where(lop_hoc_id: params[:id_class])
    # User.find_by(authentication_token: params[:authentication_token])
    # byebug
    @teacher =  Teacher.find_by(user_role_id: User.find_by(authentication_token: params[:authentication_token]).user_roles.find_by(role:1).id)
    @paramss = []
    @students.each {|s| 
      # @parent = Parent.find(s.parent_id)
      # @parent_user = User.find(UserRole.find(@parent.user_role_id).user_id)
      @user_role = UserRole.find(s.user_role_id)
      @user = User.find(@user_role.user_id)
      @score_arr = s.score_arrs.where(subject_id: @teacher.subject_id)
      @subject = Subject.find(@teacher.subject_id)
      @params = {mssv: s.id, name: @user.name, HK1: @score_arr.first.scores, HK2: @score_arr.second.scores, subject: @subject}
      @paramss.push(@params)}
    render json: @paramss
  end
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
  
  def getAllClassEveryTeacher
    @user = User.find_by(authentication_token: params[:token])
    @classes = nil
    role1 = @user.user_roles[0]
    role2 = @user.user_roles[1]
    if role1.role === 1
      @classes = role1.teacher.lop_hocs
    else role2 && role2.role  === 1
      @classes = role2.teacher.lop_hocs
    end
    if @classes != nil && @classes.length > 0
      @numberStudents = studentCount(@classes)
      render json:{classes: @classes , numberStudents: @numberStudents }, status: 200
    else
      render status: 404
    end
  end

  def studentCount classes
    numberStudents = []
    classes.each_with_index do |s|
      numberStudents << s.students.count
    end
    return numberStudents
  end

  # def getStudentInClass
  #   @lop_hoc = LopHoc.find(params[:id_class])
  #   @students = @lop_hoc.students
  #   byebug
  #   if @students && @students != []
  #     render json: {students: @students}, status: 200
  #   else
  #     render status: 404
  #   end
  # end

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
