class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/1
  def show
    if @user
      @roles = @user.user_roles
      render json: {user:@user.as_json(except: [:updated_at,:created_at]),roles: @roles.as_json(except: [:updated_at,:created_at])}, status: 200      
    else
      render status: 404
    end
  end

  # POST /users
  def create 
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user
      password = params[:password]
      if password === ""
        @user.update(user_params_none_password)
      else
        @user.update(user_params)
      end
      render json: @user, except: [:created_at, :updated_at], status: 202
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by(authentication_token: params[:authentication_token])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.permit(:name, :birthday, :address, :password)
    end

    def user_params_none_password
      params.permit(:name, :birthday, :address)
    end
end
