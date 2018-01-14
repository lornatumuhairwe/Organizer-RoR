require 'faker'

User.create!(email: 'test@app.com', password: 'password', password_confirmation: 'password')

3.times do |n|
  email = Faker::Internet.unique.email
  password = 'password'
  User.create!(email: email, password: password, password_confirmation: password)
end

users = User.all

15.times do
  title = Faker::Hacker.noun
  description = Faker::Hacker.say_something_smart
  user = users.sample
  user.categories.create!(title: title, description: description)
end