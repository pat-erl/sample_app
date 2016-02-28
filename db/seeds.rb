User.create!(name:  "Patrik Erlandsson",
             email: "patrik@patrik.com",
             password:              "patrik",
             password_confirmation: "patrik",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "testing-#{n+1}@testing.com"
  password = "testing"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
3.times do
  content = Faker::Lorem.sentence(1)
  users.each { |user| user.applications.create!(description: content, APIkey: "hdgt3jh6nj34") }
end