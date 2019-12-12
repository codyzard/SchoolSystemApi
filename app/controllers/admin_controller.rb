class AdminController < ApplicationController
    def get_teachers
        @ur = get_role(1)
        render json: {@ur.teacher , @ur.user}
    end
    def get_parents
        @ur = get_role(2)
        render json: {@ur.parent , @ur.user}
    end
    def get_students
        @ur = get_role(3)
        render json: {@ur.student , @ur.user}
    end
    def create_user
        #params[
          # :name,
          # :email,
          # :password,
          # :birthday,
          # :address,
          # :role]
        user = User.create!(
            name: params[:name],
            email: params[:email],
            address: params[:address],
            birthday: params[:birthday],
            password: params[:password],
        )
        case params[:role]
            when 1
                ur = user.user_roles.create(role: 1)
                Teacher.create(user_role_id: ur.id)
            when 2
                ur = user.user_roles.create(role: 1)
                Parent.create(user_role_id: ur.id)
            when 3
                ur = user.user_roles.create(role: 1)
                Student.create(user_role_id: ur.id)
        end
        render json: user
    end
    private 
        def get_role role
            return UsesRole.where(role: role)
        end
end