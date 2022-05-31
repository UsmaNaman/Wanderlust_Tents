# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "cleaning database"
Tent.destroy_all
User.destroy_all

puts "creating tents"

tassilo = User.create!(email: "tassilo@ibrecht.net", password: "123456")

Tent.create!(title: "Berghaus Air Tent Porch", description: "Super tent, amazing quality, great for usman's beauty sleep", capacity: "1 Usman", location: "Sexy street EY 169", price: "1000", user: tassilo )

Tent.create!(title: "Outdoor revolution", description: "This drive-away awning makes it easy for you to come and go in your campervan without having to take down your awning every time. It has an air beam construction for quick pitching and it easily attaches to most low-roof campervans.", capacity: "5 people - suitble for families", location: "Tottenham Court Road W1T 7RJ", price: "1", user: tassilo)

Tent.create!(title: "Eurohike Tepee Tent", description: "Evoke the scout camps of your youth with this retro tepee tent from Eurohike. A simple construction, using a single steel pole and flysheet, creates a lot of living space for weekends away. The flysheet and groundsheet are waterproof to 2000mm hydrostatic head, meaning they will keep the British weather outside. With plenty of headspace, the tepee tent restores a bit of the old school to your camping adventures.", capacity: "4 people", location: "London WC2H 9FB", price: "250 Pounds", user: tassilo)

Tent.create!(title: "Eurohike Tamar 2 Tent", description: "Easy to pitch and super-light, the Tamar is a surprisingly spacious 2 man tent perfect for backpacking adventures where weight and size matters. The extended porch and dome design creates a roomy interior for two while the fully waterproof and breathable fabric construction maintains a comfortable climate within the tent for a comfortable night’s sleep.", capacity: "2 people", location: "London E2 8DY", price: "1000", user: tassilo )

Tent.create!(title: "Phoxx 2 Tent", description: "If your heading on an expedition or wild camping trip and need a compact, lightweight, waterproof shelter, pick up an OEX Phoxx 2 Tent. As well as providing a robust structure, the pre-angled pole design also pro vides porch space to store wet kit. The breathable inner tent section can be used on its own on warm days for a more comfortable place to rest.", capacity: "2 people", location: "London NW1 8DB", price: "20 pence", user: tassilo )
