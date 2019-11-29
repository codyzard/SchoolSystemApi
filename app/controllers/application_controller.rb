class ApplicationController < ActionController::API
    include ActionController::MimeResponds

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email,:password])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :password])
    end
end
