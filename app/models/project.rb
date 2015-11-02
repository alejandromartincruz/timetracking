class Project < ActiveRecord::Base
	def self.iron_high_priority
		puts "in da class method"
		where("title like 'ironhack%' AND priority = 3")
	end

	def self.low_priority
		puts "Showing low priority projects"
		where("priority < 3")
	end

	def self.clean_low_priority
		puts "Let's make some cleaning..."
		projects = where(priority: 1)
		projects.destroy_all
	end
end
