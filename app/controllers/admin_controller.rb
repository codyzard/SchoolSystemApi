class AdminController < ApplicationController
    def get_teachers
        @ur = get_role(1)
        data = []
        @ur.each do |i| 
            data.push({user: i.user,teacher: i.teacher})
        end
        render json: data
    end
    def get_parents
        @ur = get_role(2)
        data = []
        @ur.each do |i| 
            data.push({user: i.user,teacher: i.teacher})
        end
        render json: data
    end
    def get_students
        @ur = get_role(3)
        data = []
        @ur.each do |i| 
            data.push({user: i.user,student: i.student})
        end
        render json: data
    end
    def create_user
        #params[
          # :name,
          # :email,
          # :password,
          # :birthday,
          # :address,
          # :role]
          byebug
        user = User.create!(
            name: params[:name],
            email: params[:email],
            address: params[:address],
            birthday: params[:birthday],
            password: params[:password],
        )
        ur = user.user_roles.create(role: parmas[:role])
        case params[:role]
            when 1
                teacher =Teacher.create(user_role_id: ur.id)
                render json: {:role=> params[:role],data =>{:user=> user, :teacher => teacher}}
            when 2
                parent =Parent.create(user_role_id: ur.id)
                render json: {:role=> params[:role],data=>{:user=> user, :parent => parent}}
            when 3
                student =Student.create(user_role_id: ur.id)
                render json: {:role=> params[:role],data=>{:user=> user, :student => student}}
        end
    end
    private 
        def get_role role
            return UserRole.where(role: role)
        end
end