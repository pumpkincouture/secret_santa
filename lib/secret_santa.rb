require 'csv'
require_relative 'person.rb'

class SecretSanta
	attr_reader :santa_list, :santa_shuffled, :people

	def initialize
		@santa_list = santa_list
		@santa_shuffled = santa_shuffled
		@people = people
	end

	def people_list
		people_list = []
		csv_data = CSV.foreach('./lib/example.csv') do |row|
			@people = Person.new(row) 
			people_list << @people
		end
		@santa_list = people_list
		@santa_list
	end

	def random_list
		duplicate_list = @santa_list.clone
		@santa_shuffled = duplicate_list.sort_by { rand }
		@santa_shuffled
	end

	def assign_random_santa
		number = @santa_shuffled.length - 1
		@santa_list.each do |person|
			potential_partner = @santa_shuffled[ rand ]
			person.assigned_santa = potential_partner if @people.not_assigned(potential_partner)
			@santa_shuffled.delete(potential_partner)
		end
	end
end
