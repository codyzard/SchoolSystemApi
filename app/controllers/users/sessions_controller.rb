# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create  
    user = User.where(email: params[:email]).first
    role =  user.user_roles.find_by(role:  params[:role])
    if user && user.valid_password?(params[:password]) && role
        render json: {user:user.as_json(except: [:updated_at,:created_at]),role: role.as_json(except: [:updated_at,:created_at])}, status: 201
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
