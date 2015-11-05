class Project < ActiveRecord::Base
	validates :title, uniqueness: true 
	validates :title, presence: true
	validates :title, length: {maximum: 30}
	validates :title, format: { with: /\A[A-Za-z0-9]/ }
	validates :priority, presence: true, inclusion: { in: [1, 2, 3, 4, 5]}
	
	has_many :entries, dependent: :destroy

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

	def total_time
		entries.reduce(0) do |acc, entry|
			acc + entry.total_minutes
		end
	end
end
