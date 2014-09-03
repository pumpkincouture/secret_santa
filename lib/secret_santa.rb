require 'csv'
require_relative 'person.rb'

class SecretSanta
	attr_reader :santa_list, :santa_shuffled

	def initialize
		@santa_list = santa_list
		@santa_shuffled = santa_shuffled
	end

	def people_list
		people_list = []
		csv_data = CSV.foreach('./lib/example.csv') do |row|
			@people = Person.new(row) 
			people_list << @people
		end
		@santa_list = people_list
	end

	def random_list
		duplicate_list = @santa_list.clone
		@santa_shuffled = duplicate_list.sort_by { rand }
	end

	def how_many_families
		list_length = @santa_list.length 
		family_members = @santa_list.group_by{|person| person.last }.values.select{|last_name| last_name.size >= list_length/2.0}
		return true unless family_members.empty?
		false
	end

	def print_error
		boolean = how_many_families
		puts "Sorry, no combination exists." if boolean
		false
	end

	def assign_random_santa
		santa_shuffled = @santa_shuffled.clone
		santa_list = @santa_list.clone
		  santa_list.each do |person|
		  	potential_partner = santa_shuffled [ rand ]
		  	potential = santa_shuffled.select{ |potential_person| person.not_self(potential_person) }
				person.assigned_santa = potential [ rand ] unless potential.empty?
		  	santa_shuffled.delete(person.assigned_santa)
		  end
	  santa_list
	end
		
	def assign_correct_santa
		assigned = assign_random_santa
		santa_shuffled = @santa_shuffled.clone
			assigned.each do |person|
			  potential = assigned.select{ |other_person| person.assigned_santa.legit_santa(other_person) && 
																		  other_person.assigned_santa.legit_santa(person) }
			  unless potential.empty?
				  other_person = potential [ rand ]
				  to_swap = person.assigned_santa
				  person.assigned_santa = other_person.assigned_santa
				  other_person.assigned_santa = to_swap
			  end
		  end
	end

	def print_assigned
  	correct_list = assign_correct_santa
		
		correct_list.each do |person|
		  p person.first + " " + person.last + ", " + person.assigned_santa.first + " " + person.assigned_santa.last
		end
	end
end
