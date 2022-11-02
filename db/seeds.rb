# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

Camera.destroy_all

pirce = ["55", "65", "85", "95", "60", "70", "80", "90", "200", "300", "400"]

users = []

5.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
  user.save!
  users << user
end


120.times do
  camera = Camera.new(
    name: Faker::Camera.brand_with_model,
    price: pirce.sample,
    location: Faker::Address.city,
    user: users.sample
  )
  camera.save!
  puts "Camera: #{camera.name}, Price: #{camera.price}, Location:#{camera.name}"
end
puts "Cameras created"
