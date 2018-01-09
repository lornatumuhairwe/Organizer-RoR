require 'faker'

Category.create!(title: 'Work',
                 description: 'work activities')

10.times do |n|
  title = Faker::Hacker.noun
  description = Faker::Hacker.say_something_smart
  Category.create!(title: title,
                   description: description)
end