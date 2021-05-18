# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create user instance for each team member
# save in variable
# create 5 instrument instances

require 'faker'

puts 'Creating 15 instruments...'
15.times do |i|
  instrument = Instrument.create!(
    name: Faker::Games::Zelda.character,
    model: Faker::Company.catch_phrase,
    category: Faker::Music.instrument,
    details: Faker::Company.catch_phrase,
    year: rand(1950..2021)
    rate: (rand(0.1) * 10).round(2),
    owner_id: User.find(id = rand(1..3))
  )
  puts "#{i + 1}. #{instrument.name}"
end
puts 'Finished!'