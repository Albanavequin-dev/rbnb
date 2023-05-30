# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

10.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthdate: Faker::Date.birthday(min_age: 18, max_age: 65).strftime("%Y-%m-%d"),
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

10.times do
  Flat.create(
    address: Faker::Address.full_address,
    description: Faker::Lorem.paragraph
  )
end
