# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require 'geocoder'

Booking.destroy_all
Flat.destroy_all


10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthdate: Faker::Date.birthday(min_age: 18, max_age: 65).strftime("%Y-%m-%d"),
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

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

ad.each do |address|
  10.times do
    flat = Flat.new(
      name: Faker::Lorem.word,
      address: address,
      description: Faker::Lorem.paragraph,
      wifi: [true, false].sample,
      TV: [true, false].sample,
      parking: [true, false].sample,
      air_conditioner: [true, false].sample
    )
    flat.user = users.sample
    flat.save
  end
end
