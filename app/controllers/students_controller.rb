class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :update, :destroy, :student_detail, :student_score]

  def student_detail_with_token
    @student = Student.find_by(user_role_id:User.find_by(authentication_token: params[:authentication_token]).user_roles[0].id)
    @parent = Parent.find(@student.parent_id)
    @parent_user = User.find(UserRole.find(@parent.user_role_id).user_id)
    @user_role = UserRole.find(@student.user_role_id)
    @user = User.find(@user_role.user_id)
    @params = {student_user_info:@user,student_info:@student,parent_info:@parent_user}
    # @parasm = @parent_user
    render json: @params
  end
  def student_detail
    @parent = Parent.find(@student.parent_id)
    @parent_user = User.find(UserRole.find(@parent.user_role_id).user_id)
    @user_role = UserRole.find(@student.user_role_id)
    @user = User.find(@user_role.user_id)
    @params = {lop_hoc_id:@student.lop_hoc_id,mssv: @student.id, name: @user.name, parent:@parent_user.name, parent_detail: @parent_user, address: @user.address, email:@user.email, birthday: @user.birthday}
    render json: @params
  end

  def student_score
    @score_arr =  @student.score_arrs
    @params = []
    @hocki= []
    dem = 0
    hk= 0
    @score_arr.each{ |sa|
      hk=dem/7+1
      @hocki.push(heso1:sa.scores[0].score,heso2:sa.scores[1].score,heso3:sa.scores[2].score,heso4:sa.scores[3].score,mon:Subject.find(sa.subject_id).name,hocki:"HK "+"#{(hk-1)%2+1} "+"năm "+"#{(hk-1)/2+1}")
      if((dem+1)%7==0)
        @params.push(@hocki)
        @hocki = []
      end
      dem+=1
    }
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
