address = Address.create! city: "hanoi"
Tour.create!(name: "hanoi", content: "noidung", price: 200, address_id: address.id)

20.times.each{|x| Tour.create(name:"Tour_#{x}",content:"noidung_#{x}", price: x*100, address_id: 1)}