# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

Offer.destroy_all
Camera.destroy_all

pirce = ["55", "65", "85", "95", "60", "70", "80", "90", "200", "300", "400"]
city = ["Pairs", "London", "Berlin", "Valletta", "Amsterdam", "Helsinki", "Rome", "Prahue", "Venice", "Barcelona", "Munich", "Budapest", "Seville", "Lisbon", "Copenhagen", "Stockholm", "Athens", "Istanbul", "Edinburgh", "Porto", "Galway", "Zurich", "Oslo", "Dublin", "Paris",
        "Milan", "Helsinki", "Annecy", "Saint Petersburg", "Bergen", "Brussels", "Bucharest", "Bern", "Kyiv", "Basel", "Tokyo", "Kyoto", "Osaka", "Hokkaido", "Seul", "Busan", "Perth", "Adeleide", "Sydny", "Darwin"]

users = []

5.times do
  user = User.new(
    # first_name: Faker::Name.first_name,
    # last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "*************"
  )
  user.save!
  users << user
end


120.times do
  camera = Camera.new(
    name: Faker::Camera.brand_with_model,
    price: pirce.sample,
    location: city.sample,
    user: users.sample
  )
  camera.save!
  puts "Camera: #{camera.name}, Price: #{camera.price}, Location:#{camera.name}"
end
puts "Cameras created"
