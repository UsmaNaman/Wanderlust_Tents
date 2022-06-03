# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'

puts "cleaning database"
Booking.destroy_all
Tent.destroy_all
User.destroy_all

puts "creating tents"

tassilo = User.create!(email: "tassilo@ibrecht.net", password: "123456")

file_1 = URI.open("https://res.cloudinary.com/tassilobrecht/image/upload/v1654250824/berghaus_berghaus_lu4uti.jpg")
tent_1 = Tent.create!(title: "Berghaus Air Tent Porch", description: "Featuring the same rapid-inflation system as the tent, the porch uses air beams to construct a stable space with ease. The beams are made from durable materials and include a repair kit, making them a great choice for busy family camping trips.", capacity: "5 people", location: "Camden Town", price: "50 PPD", user: tassilo )
tent_1.photo.attach(io: file_1, filename:"nes.jpg", content_type: "image/jpg")

file_2 = URI.open("https://res.cloudinary.com/tassilobrecht/image/upload/v1654251024/cartent_ngbr8i.jpg")
tent_2 = Tent.create!(title: "Outdoor revolution", description: "This drive-away awning makes it easy for you to come and go in your campervan without having to take down your awning every time. It has an air beam construction for quick pitching and it easily attaches to most low-roof campervans.", capacity: "5 people - suitble for families", location: "Notting Hill", price: "22 PPD", user: tassilo)
tent_2.photo.attach(io: file_2, filename:"nes.jpg", content_type: "image/jpg")

file_3 = URI.open("https://res.cloudinary.com/tassilobrecht/image/upload/v1654250139/teepee_vsktiy.jpg")
tent_3 = Tent.create!(title: "Eurohike Tepee Tent", description: "A simple construction, using a single steel pole and flysheet, creates a lot of living space for weekends away. The flysheet and groundsheet are waterproof to 2000mm hydrostatic head, meaning they will keep the British weather outside.", capacity: "4 people", location: "Chelsea", price: "82 PPD", user: tassilo)
tent_3.photo.attach(io: file_3, filename:"nes.jpg", content_type: "image/jpg")

file_4 = URI.open("https://res.cloudinary.com/tassilobrecht/image/upload/v1654251225/2mantent_fdpzc6.webp")
tent_4 = Tent.create!(title: "Eurohike Tamar 2 Tent", description: "Easy to pitch and super-light, the Tamar is a surprisingly spacious 2 man tent perfect for backpacking adventures where weight and size matters. The extended porch and dome design creates a roomy interior for two.", capacity: "2 people", location: "Vauxhall", price: "18 PPD", user: tassilo )
tent_4.photo.attach(io: file_4, filename:"nes.webp", content_type: "image/webp")

file_5 = URI.open("https://res.cloudinary.com/tassilobrecht/image/upload/v1654251544/phoxx2_qessqv.jpg")
tent_5 = Tent.create!(title: "Phoxx 2 Tent", description: " A compact, lightweight, waterproof shelter, pick up an OEX Phoxx 2 Tent. As well as providing a robust structure, the pre-angled pole design also pro vides porch space to store wet kit. The breathable inner tent section can be used on its own on warm days for a more comfortable place to rest.", capacity: "2 people", location: "Shoreditch", price: "40 PPD", user: tassilo )
tent_5.photo.attach(io: file_5, filename:"nes.jpg", content_type: "image/jpg")

file_6 = URI.open("https://res.cloudinary.com/tassilobrecht/image/upload/v1654251319/marquee_mlwqzk.jpg")
tent_6 = Tent.create!(title: "5x10m Marquee", description: "Compact in storage, lightweight and easy to assemble: Our Economy PE marquees from our Product Line Optiline offer a particularly quick set up thanks to the high-quality click-in system. The fully galvanised steel frame is protected against corrosion. ", capacity: "100 people", location: "Barnet", price: "20 PPD", user: tassilo )
tent_6.photo.attach(io: file_6, filename:"nes.jpg", content_type: "image/jpg")

puts "All done"
