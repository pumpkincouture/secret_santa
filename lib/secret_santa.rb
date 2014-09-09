require 'csv'
require_relative 'person'


class SecretSanta

	def initialize(find_santas)
		@find_santas = find_santas
	end

	def run!(list)
		get_list = get_people_list(list)
		get_random_list = random_list(get_list)
		print_error(@find_santas.get_family_members(get_list))
		print_assigned(@find_santas.assign_correct_santa(@find_santas.assign_random_santa(get_list, get_random_list)))
	end

	def get_people_list(list)
		people_list = []
		csv_data = CSV.foreach(list) do |row|
			people_list << people = Person.new(row) 
		end
		santa_list = people_list
	end

	def random_list(santa_list)
		duplicate_list = santa_list.clone
		santa_shuffled = duplicate_list.sort_by { rand }
	end

	def print_error(family_members)
		raise "No combinations available" if !family_members.empty?
	end

	def print_assigned(correct_list)
		correct_list.each do |person|
		  p person.first + " " + person.last + ", " + person.assigned_santa.first + " " + person.assigned_santa.last
		end
	end
end
