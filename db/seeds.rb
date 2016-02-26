User.create!(name:  "Patrik",
             email: "patrik@patrik.com",
             password:              "patrik",
             password_confirmation: "patrik",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end