# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create  
    # byebug
    user = User.where(email: params[:email]).first
    roles =  user.user_roles
    teacher = roles[0].teacher
    # byebug
    if user && user.valid_password?(params[:password]) && roles
        render json: {
        user:user.as_json(except: [:updated_at,:created_at]),
        roles: roles.as_json(except: [:updated_at,:created_at]),
        teacher: teacher.as_json(except: [:updated_at,:created_at])
        }, 
        status: 201

    else
        head(:unauthorized)
    end
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
