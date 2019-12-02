#user
User.create!(
    name:  "admin",
    email: "admin@gmail.com",
    address: "54 Nguyen Luong Bang",
    birthday: "01-07-1998".to_date,
    password: "123456"
)
User.first.user_roles.create(role: 1)
Teacher.create(admin: true, user_role_id: UserRole.find_by(user_id: User.first.id) )
checkRole = 0;
269.times do |n|
    name  = Faker::Name.name
    email = "user#{n+1}@gmail.com"
    address = "54 Nguyen Luong Bang"
    birthday= "01-07-1998".to_date
    password = "123456"
    user = User.create!(
        name:  name,
        email: email,
        address: address,
        birthday: birthday,
        password: "123456",
    )
    if (checkRole <= 28) 
        ur = user.user_roles.create(role: 1)
        Teacher.create(user_role_id: ur.id)
    elsif (checkRole >= 29 && checkRole <= 108 ) #parents
        ur = user.user_roles.create(role: 2)
        Parent.create(user_role_id: ur.id)
    elsif ( checkRole >=109 && checkRole <= 268) #student
        user.user_roles.create(role: 3)
    end
    checkRole += 1
end

parents = UserRole.where(role: 2) #RoleParent
students = UserRole.where(role: 3) #RoleStudent
parents.each_with_index do |p,index| 
    2.times do |n|
        oya = Parent.find_by(user_role_id: p.id)
        oya.students.create(user_role_id: students[index*2+n].id) 
    end
end

4.times do |n|
    n+=6
    name = "Lớp "+n.to_s
    Grade.create!(name: name)
end
Subject.create!(name: "Toán")
Subject.create!(name: "Vật lý")
Subject.create!(name: "Hóa học")
Subject.create!(name: "Sinh học")
Subject.create!(name: "Lịch sử")
Subject.create!(name: "Địa lý")
Subject.create!(name: "Ngữ văn")

8.times do |lop|
    l=LopHoc.create!(grade_id: (lop/2+1),name: "#{lop/2+6}"+"/"+"#{lop/2+1}")
    7.times do |a|
        l.teachers<<Teacher.find(a+1+(lop/2)*7+1)
    end
end
160.times do |n|
    l=LopHoc.find(n/20+1)
    l.students<<Student.find(n+1)
end

28.times do |teacher|
    teacher_id = teacher + 2
    sj_id = teacher_id - ( 7*(teacher/7) + 1)
    t = Teacher.find(teacher_id)
    t.subject_id = sj_id
    t.save
end

