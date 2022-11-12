# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"
require "open-uri"

Offer.destroy_all
Camera.destroy_all

photos = ["https://images.unsplash.com/photo-1516035069371-29a1b244cc32?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1364&q=80",
  "https://images.unsplash.com/photo-1510127034890-ba27508e9f1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
  "https://images.unsplash.com/photo-1552168324-d612d77725e3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Y2FtZXJhfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1534131707746-25d604851a1f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
  "https://images.unsplash.com/photo-1607462109225-6b64ae2dd3cb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1491796014055-e6835cdcd4c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1512790182412-b19e6d62bc39?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1502982720700-bfff97f2ecac?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1580707221190-bd94d9087b7f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1568819107248-c5ebc8b62fad?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1516724562728-afc824a36e84?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjF8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1581591524425-c7e0978865fc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1591681354784-c684e483dae0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1580852300513-9b50125bf293?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjd8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1616088886430-ccd86fef0713?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjh8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1609034227505-5876f6aa4e90?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzB8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1536632087471-3cf3f2986328?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzR8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1565551069968-949366aa4cac?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzV8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1551264950-49fb963d1493?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzd8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1488240339625-c4014e114224?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzh8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1480365501497-199581be0e66?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzl8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1542567455-cd733f23fbb1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDB8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1486492440844-ebc195542a40?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDF8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1582994254571-52c62d96ebab?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDN8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1520549233664-03f65c1d1327?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDR8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1573320286044-b43a4168fb40?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDV8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1603208234872-619ffa1209cb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDZ8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1621985499238-698dfd45b017?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDd8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1485846147915-69f12fbd03b9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDl8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1625571281240-694bfa82e4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTF8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1519638831568-d9897f54ed69?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTJ8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1543785832-0781599790c2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTB8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1625571281240-694bfa82e4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTF8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1556103255-4443dbae8e5a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTR8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1659536002780-73275f63f11c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxzZWFyY2h8NTV8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1551332772-f6bc95b9ed1f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTZ8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1495707902641-75cac588d2e9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTd8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1589872338621-8f85acadd204?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTh8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1541516160071-4bb0c5af65ba?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjB8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1603457893497-4de5ef1d8ab1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjF8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1536627217140-899b0bc9d881?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjN8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1565087918595-8c2af193ecbc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Njd8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1519458246479-6acae7536988?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y2FtZXJhJTIwbGVpY2F8ZW58MHx8MHx8&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1469210537992-30c8c8abef12?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Y2FtZXJhJTIwbGVpY2F8ZW58MHx8MHx8&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1523607834662-b27a3f036f3f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Y2FtZXJhJTIwbGVpY2F8ZW58MHx8MHx8&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1466553359530-7387151ec321?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Y2FtZXJhJTIwbGVpY2F8ZW58MHx8MHx8&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1533923468285-0168217fad29?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8Y2FtZXJhJTIwbGVpY2F8ZW58MHx8MHx8&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1532716377393-5ffbea548d05?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGNhbWVyYSUyMGxlaWNhfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1446806837749-5154b3272a97?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGNhbWVyYSUyMGxlaWNhfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=1296&q=60",
  "https://images.unsplash.com/photo-1524150224905-3f0639c70974?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGNhbWVyYSUyMGxlaWNhfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=1296&q=60"]


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
  file = URI.open(photos.sample)
  camera.photo.attach(io: file, filename: "image.png", content_type: "image/png")
  camera.save!
  puts "Camera: #{camera.name}, Price: #{camera.price}, Location:#{camera.name}"
end
puts "Cameras created"
