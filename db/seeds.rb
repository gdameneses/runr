
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

r = Restaurant.new
r.name = 'Restaurante'
puts "Creating #{r.name} for #{User.first.email}"
r.user = User.first
r.save

puts '========================================'

stations = [
  'Headset', 'DT Cashier', 'DT Presenter', 'DT Checker',
  'DT Drinks', 'DT Runner', 'FC Runner', 'FC Presenter', 'FC Checker',
  'FC Drinks', 'Dinning Area', 'Kitchen Manager', 'Grill', 'Fries',
  'Chicken', 'Backroom', 'Initiatior', 'Dresser', 'Finisher'
]

stations.each do |station|
  puts "Creating #{station} for #{r.name}"
  s = Station.new
  s.name = station
  s.restaurant = r
  s.save
end

puts '========================================'

30.times do
  w = Worker.new
  w.first_name = Faker::Name.first_name
  w.last_name = Faker::Name.last_name
  w.restaurant = r
  puts "Creating #{w.first_name} #{w.last_name} for #{r.name}"
  w.save
  Station.all.each do |station|
    skill = Skill.new
    skill.level = rand(1..5)
    skill.station = station
    skill.worker = w
    skill.save
  end
end

puts '========================================'

puts "DB is seeded with Restaurant added to first user.\nCreated workers, stations and skills."
