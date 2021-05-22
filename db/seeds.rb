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
photos = ["https://source.unsplash.com/XIe1b4k9-k0/200x200",
          "https://source.unsplash.com/uqKyeMaaAOQ/200x200",
          "https://source.unsplash.com/fTPSm7KD_d0/200x200",
          "https://source.unsplash.com/rCca942E_sI/200x200",
          "https://source.unsplash.com/TRy6ZrPzDkM/200x200"
        ]

puts 'Creating 15 instruments...'
puts "added a change"
15.times do
  instrument = Instrument.create!(
    name: Faker::Music.instrument,
    model: Faker::Company.duns_number,
    category: ['woodwinds', 'brass', 'strings', 'percussion'].sample,
    details: Faker::Quote.famous_last_words,
    year: rand(1950..2021),
    rate: (rand(0.1) * 10).round(2),
    owner: User.all.sample,
    address: Faker::Address.full_address,
    photo: Cloudinary::Uploader.upload(photos.sample)
  )
end
puts 'Finished!'
