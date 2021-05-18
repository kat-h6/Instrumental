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
Instrument.destroy_all
User.destroy_all

User.create(email: "kathy@gmail.com", password: "password")
User.create(email: "tavis@gmail.com", password: "password")
User.create(email: "Sepideh@gmail.com", password: "password")
User.create(email: "chris@gmail.com", password: "password")

puts 'Creating 15 instruments...'
15.times do
  instrument = Instrument.create!(
    name: Faker::Games::Zelda.character,
    model: Faker::Company.duns_number,
    category: Faker::Music.instrument,
    details: Faker::Quote.famous_last_words,
    year: rand(1950..2021),
    rate: (rand(0.1) * 10).round(2),
    owner: User.all.sample
  )
end
puts 'Finished!'