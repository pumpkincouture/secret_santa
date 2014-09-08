require 'csv'
require_relative 'person.rb'

class SecretSanta

	def play!(list)
		get_list = get_people_list(list)
		get_random_list = random_list(get_list)
		print_error(get_family_members(get_list))
		# assign_correct_santa(assign_random_santa(get_list, get_random_list))
		print_assigned(assign_correct_santa(assign_random_santa(get_list, get_random_list)))
	end

	def get_people_list(list)
		people_list = []
		csv_data = CSV.foreach(list) do |row|
			people = Person.new(row) 
			people_list << people
		end
		santa_list = people_list
	end

	def random_list(santa_list)
		duplicate_list = santa_list.clone
		santa_shuffled = duplicate_list.sort_by { rand }
	end

	def get_family_members(santa_list)
	  list_length = santa_list.length 
		family_members = santa_list.group_by{|person| person.last }.values.select{|last_name| 
																				 last_name.size >= list_length/2.0}
	end

	def print_error(family_members)
		raise "No combinations available" if !family_members.empty?
	end

	def assign_random_santa(santa_list, santa_shuffled)
		 santa_list.each do |person|
		   potential = santa_shuffled.select{ |potential_person| person.not_self(potential_person) }
			 person.assigned_santa = potential [ rand ] unless potential.empty?
		   santa_shuffled.delete(person.assigned_santa)
		 end
	end
		
	def assign_correct_santa(random_list)
			random_list.each do |person|
			  potential = random_list.select{ |other_person| person.assigned_santa.legit_santa(other_person) && 
																		  other_person.assigned_santa.legit_santa(person) }
			  raise if potential.empty?
				  other_person = potential [ rand ]
				  to_swap = person.assigned_santa
				  person.assigned_santa = other_person.assigned_santa
				  other_person.assigned_santa = to_swap
		  	end
	end

	def print_assigned(correct_list)
		correct_list.each do |person|
		  p person.first + " " + person.last + ", " + person.assigned_santa.first + " " + person.assigned_santa.last
		end
	end
end
