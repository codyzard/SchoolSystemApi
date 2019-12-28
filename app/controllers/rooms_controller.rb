class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :update, :destroy]
  before_action :find_user, only: [:getRoom, :create_group_class_chat,:create_room_1vs1, :havedFriend]
  # GET /rooms
  def getRoom
    @rooms = @user.rooms
    @lastMessArr = getLastMess(@rooms)
    render json: {rooms: @rooms, lastMessArr: @lastMessArr }
  end

  def index
    # @rooms = Room.all
    @rooms = @user.rooms
    @lastMessArr = getLastMess(@rooms)
    render json: {rooms: @rooms, lastMessArr: @lastMessArr }
  end

  def getLastMess rooms
    arr =[]
    rooms.each_with_index do |room, index|
      m = Mess.where(room_id:room.id).last
      if (m != nil)
        arr << m
      else
        arr << " "
      end
    end
    return arr
  end
  # GET /rooms/1
  def show
    render json: @room
  end

  # POST /rooms
  def create
    @room = Room.new(room_params)

    if @room.save
      render json: @room, status: :created, location: @room
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rooms/1
  def update
    if @room.update(room_params)
      render json: @room
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rooms/1
  def destroy
    @room.destroy
  end

  #Create group chat for class
  def check_exist_room_class nameGroup
    Room.all.include?(Room.find_by(name: nameGroup));
  end
  
  def create_group_class_chat
      @lophoc = LopHoc.find(params[:id_lophoc])
      @students = @lophoc.students
      @nameGroup = @lophoc.name + "(Khoa: " + @lophoc.created_at.year.to_s + ")"+"-(token: "+@user.authentication_token+")" 
      check = check_exist_room_class(@nameGroup)
      if check
        render status: 204
      else
        @room = @user.rooms.create(name: @nameGroup)
        @students.each_with_index do |s,i|
          @room.users << s.user_role.user
        end
        if @room != nil
          render json: @room, status: 200
        else
          render status: 404
        end
      end
  end
  
  def create_room_1vs1
    @student = Student.find(params[:id_student])
    @friend = @student.user_role.user
    @nameRoom = @user.name + ", " + @friend.name + "-(token: "+ @user.authentication_token+ "/" + @friend.authentication_token + ")"
    check = check_exist_room_class(@nameRoom)
    if check
      render status: 404     
    else
      @room = @user.rooms.create    
      @room.update_attributes(name:  @nameRoom)
      @room.users << @friend
      render json: @room, status: 200
    end
  end
  
  def havedFriend
    @student = Student.find(params[:id_student])
    @friend = @student.user_role.user
    @nameRoom = @user.name + ", " + @friend.name + "-(token: "+ @user.authentication_token+ "/" + @friend.authentication_token + ")"
    check = check_exist_room_class(@nameRoom)
    render json: check, status: 200
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def room_params
      params.fetch(:room, {})
    end

    def find_user
      @user = User.find_by(authentication_token: params[:authentication_token])     
    end
end
