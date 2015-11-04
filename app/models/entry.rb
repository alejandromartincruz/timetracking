class Entry < ActiveRecord::Base
	validates :project, presence: true
	validates :hours, numericality: {only_integer: true, less_than: 24}
	validates :minutes, numericality: {only_integer: true, less_than: 60}
	validates :data, presence: true
	validates :hours, presence: true
	validates :minutes, presence: true

	belongs_to :project

	def total_minutes
		hours * 60 + minutes
	end
end
