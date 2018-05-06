Category.create!(name: "Bong da")

Category.create!(name: "Bong da 1",
                 parent: 1)

Category.create!(name: "Bong da 2",
                 parent: 2)

categories = Category.order(:created_at).take(3)
50.times do
  name = Faker::Lorem.sentence(5)
  description = Faker::Lorem.sentence(15)
  categories.each {|category| category.products.create!(name: name,
    price: 20, description: description)}
end

User.create!(full_name: "Tran Thi Mai Hoa",
             email: "maihoa10091996@gmail.com",
             password: "123456",
             password_confirmation: "123456",
             address: "Nam Dinh",
             phone: "0974879729",
             sex: false,
             roles: 1)

99.times do |n|
  full_name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  address = "Nam Dinh"
  phone = "0974879729"
  User.create!(full_name: full_name,
               email: email,
               password: password,
               password_confirmation: password,
               address: address,
               phone: phone)
end


