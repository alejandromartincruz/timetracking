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

Entry.destroy_all

puts "-------- All entries Destroyed --------"

Project.all.each do |project|
	(1..5).each do |i|
		project.entries.create(hours: rand(0..5), minutes: rand(0..60), comments: "This is the #{rand(1..100)} random coment for #{project}#{i}" , data: rand(Date.new(2015,10,15)..Date.today))
	end
end