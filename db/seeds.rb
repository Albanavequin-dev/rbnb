# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require 'geocoder'
require 'uri'

Booking.destroy_all
Flat.destroy_all

puts "Creating users"
10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthdate: Faker::Date.birthday(min_age: 18, max_age: 65).strftime("%Y-%m-%d"),
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end
puts "Users done"
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

pictures = ['https://www.home-designing.com/wp-content/uploads/2017/10/white-sectional-sofa.jpg',
      'https://www.home-designing.com/wp-content/uploads/2019/01/nesting-coffee-tables.jpg',
      'https://www.home-designing.com/wp-content/uploads/2014/10/lovely-living-room1.jpg',
      'https://www.relocatemagazine.com/media/images/scarpa-16_14791_compressed_31FCD1C449F3178CE482BACDE88E7BA5.jpg',
      'https://e0.pxfuel.com/wallpapers/12/377/desktop-wallpaper-beautiful-houses-beautiful-mansion.jpg',
      'https://archello.s3.eu-central-1.amazonaws.com/images/2021/02/02/leo-romano-most-beautiful-house-private-houses-archello.1612253803.2979.jpg',
      'https://architecturebeast.com/wp-content/uploads/2014/09/Most_Beautiful_Houses_In_The_World_House_M_featured_on_architecture_beast_39.jpg',
      'https://img.freepik.com/premium-photo/3d-rendering-nice-modern-style-wood-house-beautiful-village_105762-146.jpg',
      'https://www.home-designing.com/wp-content/uploads/2009/10/white-living-room.jpg',
      'https://wallpaperaccess.com/full/1700228.jpg'
    ]
puts "Creatings flats"
url = URI.parse("https://www.home-designing.com/wp-content/uploads/2017/10/white-sectional-sofa.jpg")
filename = File.basename(url.path)
file = URI.open(url)
ad.each do |address|
  10.times do
    flat = Flat.new(
      name: Faker::Lorem.word,
      address: address,
      description: Faker::Lorem.paragraph,
      wifi: [true, false].sample,
      TV: [true, false].sample,
      parking: [true, false].sample,
      air_conditioner: [true, false].sample,
    )
    flat.image.attach(io: File.open("Logo.png"), filename: "Logo.png", content_type: "image/jpg")
    flat.user = users.sample
    flat.save!
  end
end

puts "Flats created"
