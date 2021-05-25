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
require 'open-uri'
Booking.destroy_all
Instrument.destroy_all
User.destroy_all

puts "destroyed all"

User.create(email: "kathy@gmail.com", password: "password", first_name: "Kathy", last_name: "H")
User.create(email: "tavis@gmail.com", password: "password", first_name: "Tavis", last_name: "D")
User.create(email: "Sepideh@gmail.com", password: "password", first_name: "Sapideh", last_name: "S")
User.create(email: "chris@gmail.com", password: "password", first_name: "Chris", last_name: "H")

file_one = URI.open('https://images.unsplash.com/photo-1567184406952-9f6ba54cb614?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80')

instrument_one = Instrument.new(
    name: 'piccolo',
    model: 'Hammig 650/3',
    category: 'woodwinds',
    details: 'grenadilla wood',
    year: 1980,
    rate: 50,
    owner: User.last,
    address: 'Schweigaards gate 34 C, 0191 Oslo, Norway'
)
instrument_one.photo.attach(io: file_one)
instrument_one.save!
puts "created!"

file_two = URI.open('https://images.unsplash.com/photo-1569791832138-fbdd9a500384?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2850&q=80')

instrument_two = Instrument.new(
    name: 'clarinet',
    model: 'Yamaha',
    category: 'woodwinds',
    details: 'student clarinet, small crack in bell',
    year: 2000,
    rate: 30,
    owner: User.first,
    address: 'Mannerheimintie 13 A, 00100 Helsinki'
)
instrument_two.photo.attach(io: file_two, filename: 'temp.png', content_type: 'image/png')
instrument_two.save!
puts "created!"

file_three = URI.open('https://images.unsplash.com/photo-1558556405-3071bd8d3ee6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=936&q=80')
instrument_three = Instrument.new(
    name: 'violin',
    model: 'Yamaha',
    category: 'strings',
    details: 'quarter size student violin for children',
    year: 2010,
    rate: 35,
    owner: User.first,
    address: 'Urho Kekkosen katu 1, 00100 Helsinki'
)
instrument_three.photo.attach(io: file_three, filename: 'temp.png', content_type: 'image/png')
instrument_three.save!
puts "created!"

file_four = URI.open('https://images.unsplash.com/photo-1573871666457-7c7329118cf9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1350&q=80')
instrument_four = Instrument.new(
    name: 'trumpet',
    model: 'Yamaha',
    category: 'brass',
    details: 'good student trumpet, small dents',
    year: 2009,
    rate: 20,
    owner: User.last,
    address: 'Mannerheimintie 14–20, 00100 Helsinki'
)
instrument_four.photo.attach(io: file_four, filename: 'temp.png', content_type: 'image/png')
instrument_four.save!
puts "created!"

file_five = URI.open('https://images.unsplash.com/photo-1520614829617-44ad1894380c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=937&q=80')
instrument_five = Instrument.new(
    name: 'french horn',
    model: 'Holton H179',
    category: 'brass',
    details: 'professional french horn',
    year: 2011,
    rate: 40,
    owner: User.last,
    address: '5333 Avenue Casgrain Suite 102, Montréal, QC H2T 1X3, Canada'
)
instrument_five.photo.attach(io: file_five, filename: 'temp.png', content_type: 'image/png')
instrument_five.save!
puts 'created!'

file_six = URI.open('https://images.unsplash.com/photo-1595069906974-f8ae7ffc3e7a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80')
instrument_six = Instrument.new(
    name: 'drums',
    model: 'fleet',
    category: 'percussion',
    year: 2015,
    details: 'nice drums',
    rate: 25,
    owner: User.last,
    address: 'Rudi-Dutschke-Straße 26, 10969 Berlin, Germany'
)
instrument_six.photo.attach(io: file_six, filename: 'temp.png', content_type: 'image/png')
instrument_six.save!
puts 'created!'

file_seven = URI.open('https://images.unsplash.com/photo-1549264153-48f39faafc60?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80')
instrument_seven = Instrument.new(
    name: 'tuba',
    model: 'Jupiter 379 series 3',
    category: 'brass',
    details: 'good tuba',
    year: 2009,
    rate: 25,
    owner: User.first,
    address: '5333 Avenue Casgrain Suite 102, Montréal, QC H2T 1X3, Canada'
)
instrument_seven.photo.attach(io: file_seven, filename: 'temp.png', content_type: 'image/png')
instrument_seven.save!
puts 'created!'

file_nine = URI.open('https://images.unsplash.com/photo-1562808191-76e71b08a870?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1352&q=80')
instrument_nine = Instrument.new(
    name: 'flute',
    model: 'muramatsu EX with b foot joint',
    category: 'woodwinds',
    details: 'professional flute, split E mechanism',
    year: 2016,
    rate: 60,
    owner: User.last,
    address: 'Nervanderinkatu 1300100 Helsinki'
)
instrument_nine.photo.attach(io: file_nine, filename: 'temp.png', content_type: 'image/png')
instrument_nine.save!


file_eight = URI.open('https://images.unsplash.com/photo-1571327073757-71d13c24de30?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80')
instrument_eight = Instrument.new(
    name: 'nice drums',
    model: 'yamaha',
    category: 'percussion',
    details: 'cool drum',
    year: 2009,
    rate: 18,
    owner: User.first,
    address: "Carrer d'en Grassot, 101, 08025 Barcelona, Spain"
)
instrument_eight.photo.attach(io: file_eight, filename: 'temp.png', content_type: 'image/png')
instrument_eight.save!
puts "created!"



puts 'Finished!'


