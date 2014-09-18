require 'csv'
require_relative 'person'
require_relative 'find_santas'

class SecretSanta

	def run!(list)
		people_list = get_people_list(list)
		random_list = random_list(people_list)
		print_error(get_family_members(people_list))
		assigned_santas = get_assigned_santas(people_list, random_list)
		print_santas(assigned_santas)
	end

	def get_assigned_santas(people_list, random_list)
		random_santa_list = assign_random_santa(people_list, random_list)
		assign_correct_santa(random_santa_list) 
	end

	def get_people_list(list)
		people_list = []
		csv_data = CSV.foreach(list) do |row|
			people_list << @people = Person.new(row) 
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

	def assign_random_santa(santa_list, santa_shuffled)
		 santa_list.each do |person|
		   potential = santa_shuffled.select{ |potential_person| person.not_self(potential_person) }
			 person.assigned_santa = potential [ rand ] unless potential.empty?
		   santa_shuffled.delete(person.assigned_santa)
		 end
	end
		
	def assign_correct_santa(random_list)
			random_list.each do |person|
			  potential = random_list.select{ |other_person| person.swap_santa?(person, other_person) }
			  raise if potential.empty?
				  other_person = potential [ rand ]
				  to_swap = person.assigned_santa
				  person.assigned_santa = other_person.assigned_santa
				  other_person.assigned_santa = to_swap
		  	end
	end

	def print_error(family_members)
		raise "No combinations available" if !family_members.empty?
	end

	def print_santas(correct_santas)
		correct_santas.each do |santa|
			p santa.print_assigned
		end
	end
end
