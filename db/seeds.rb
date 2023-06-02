# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require 'geocoder'
require 'open-uri'

Booking.destroy_all
Flat.destroy_all

# puts " creating users"

10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthdate: Faker::Date.birthday(min_age: 18, max_age: 65).strftime("%Y-%m-%d"),
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

# puts "user's done"
users = User.all

ad = ['41 Stewart St, Melbourne',
      "10 Downing Street, London, United Kingdom",
      "1600 Pennsylvania Avenue NW, Washington, D.C., United States",
      "Champs-Élysées, Paris, France",
      "Kremlin, Moscow, Russia",
      "Brandenburg Gate, Berlin, Germany",
      "Tokyo Tower, Tokyo, Japan",
      "Sydney Opera House, Sydney, Australia",
      "Rue de Rivoli, Paris, France",
      "Piazza di Trevi, Rome, Italy"
    ]
# puts " creating flats"

# url = URI.parse('https://www.home-designing.com/wp-content/uploads/2017/10/white-sectional-sofa.jpg')
# filename = File.basename(url.path)
# file = URI.open(url).read

ad.each do |address|
  flat = Flat.new(
    name: Faker::Lorem.word,
    address: address,
    description: Faker::Lorem.paragraph,
    wifi: [true, false].sample,
    TV: [true, false].sample,
    parking: [true, false].sample,
    air_conditioner: [true, false].sample
  )
  # flat.image.attach(io: file, filename: filename)
  flat.user = users.sample
  flat.save!
end

# puts "flats ok"
