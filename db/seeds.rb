address = Address.create! city: "Ha Noi"
Tour.create!(name: "Dia diem so 0", content: "", price: 200, address_id: address.id)

60.times.each{|x| Tour.create(name: "Tour_#{x}",
                                     content: "Dia diem so #{x} la mot dia diem dep o #{Address.find(1).city}", 
                                     price: x*100, 
                                     address_id: 1)}

address = Address.create! city: "Ho Chi Minh"

60.times.each{|x| Tour.create(name: "Tour_#{x}",
                                     content: "Dia diem so #{x} la mot dia diem dep o #{Address.find(2).city}",
                                     price: x*150,
                                     address_id: 2)}

User.create!(name:  "Admin Two",
             email: "admintwo@gmail.com",
             password:              "123456",
             password_confirmation: "123456",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@gmail.com"
  password = "123456"
  User.create!(name: name,
              email: email,
              password:              "123456",
              password_confirmation: "123456")
end
