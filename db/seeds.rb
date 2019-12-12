#user
User.create!(
    name:  "admin",
    email: "admin@gmail.com",
    address: "54 Nguyen Luong Bang",
    birthday: DateTime.new(1998,01,07),
    password: "123456"
)
User.first.user_roles.create(role: 1)
Teacher.create(admin: true, user_role_id: UserRole.find_by(user_id: User.first.id) )
checkRole = 0;
15.times do |n|
    name  = Faker::Name.name
    email = "user#{n+1}@gmail.com"
    address = "54 Nguyen Luong Bang"
    birthday= DateTime.new(1998,01,07)
    password = "123456"
    user = User.create!(
        name:  name,
        email: email,
        address: address,
        birthday: birthday,
        password: "123456",
    )
    if (checkRole <= 4) 
        ur = user.user_roles.create(role: 1)
        Teacher.create(user_role_id: ur.id)
    elsif (checkRole >= 5 && checkRole <= 9 ) #parents
        ur = user.user_roles.create(role: 2)
        Parent.create(user_role_id: ur.id)
    elsif ( checkRole >=10 && checkRole <= 14) #student
        user.user_roles.create(role: 3)
    end
    checkRole += 1
end
parents = UserRole.where(role: 2) #RoleParent
students = UserRole.where(role: 3) #RoleStudent
parents.each_with_index do |p,index|
    oya = Parent.find_by(user_role_id: p.id)
    oya.students.create(user_role_id: students[index].id)
end
#RoomChat
User.all.each_with_index do |u,index|
    addFriend = User.all[index+1]
    if addFriend != nil
        r = User.first.rooms.create!(name: User.first.name + ", "+addFriend.name)
        RoomUser.create!(user_id: addFriend.id, room_id: r.id)
        mess1 = Faker::TvShows::Friends.quote
        mess2 = Faker::TvShows::Friends.quote
        User.first.messes.create!(room_id: r.id, content: mess1, user_token: User.first.authentication_token)
        addFriend.messes.create!(room_id: r.id, content: mess2, user_token: addFriend.authentication_token)
    end
end
10.times do |i|
    mess1 = Faker::TvShows::Friends.quote
    User.first.messes.create!(room_id: 1, content: mess1,user_token: User.first.authentication_token)
end
#Grade 
4.times do |n|
    n+=6
    name = "Lớp "+n.to_s
    Grade.create!(name: name)
end
#Subject
Subject.create!(name: "Toán")
Subject.create!(name: "Vật lý")
Subject.create!(name: "Hóa học")
Subject.create!(name: "Sinh học")
Subject.create!(name: "Lịch sử")
Subject.create!(name: "Địa lý")
Subject.create!(name: "Ngữ văn")
