class ParentsController < ApplicationController
  before_action :set_parent, only: [:show, :update, :destroy]

  # GET /parents
  def index
    @parents = Parent.all

    render json: @parents
  end

  # GET /parents/1
  def show
    render json: @parent
  end

  # POST /parents
  def create
    @parent = Parent.new(parent_params)

    if @parent.save
      render json: @parent, status: :created, location: @parent
    else
      render json: @parent.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /parents/1
  def update
    if @parent.update(parent_params)
      render json: @parent
    else
      render json: @parent.errors, status: :unprocessable_entity
    end
  end

  # DELETE /parents/1
  def destroy
    @parent.destroy
  end

  def getChildrenOfParent
    #Dung user_id de tim parent
    # byebug
    @parent_user = User.find_by(authentication_token: params[:authentication_token])
    # byebug
    @parent = Parent.find_by(user_role_id:@parent_user.user_roles.find_by(role:2).id)

    @students = @parent.students
    @paramss = []
    @students.each {|s| 
      # @parent = Parent.find(s.parent_id)
      # @parent_user = User.find(UserRole.find(@parent.user_role_id).user_id)
      @user_role = UserRole.find(s.user_role_id)
      @user = User.find(@user_role.user_id)
      @params = {student_id:s.id ,name: @user.name, lop_hoc: LopHoc.find(s.lop_hoc_id).name, email:@user.email, birthday:@user.birthday,address:@user.address}
      @paramss.push(@params)}
    render json: @paramss
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parent
      @parent = Parent.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def parent_params
      params.fetch(:parent, {})
    end
end
