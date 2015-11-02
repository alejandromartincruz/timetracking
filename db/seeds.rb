# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Running seeds file..."

Project.destroy_all

puts "-------- All Projects Destroyed --------"

(1..5).each do |i|
	Project.create(title: "Ironhack number #{i}", description: "#{i} This a random comennt number #{rand(1..100)}", priority: rand(1..3))
	Project.create(title: "Personal number #{i}", priority: rand(1..3))
end