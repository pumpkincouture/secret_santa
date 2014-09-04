require './lib/person.rb'
require './lib/secret_santa.rb'

santa = SecretSanta.new
santa.people_list
santa.random_list

unless santa.how_many_families?(santa.get_family_members)
	  santa.print_assigned(santa.assign_correct_santa(santa.assign_random_santa))
end
santa.print_error(santa.how_many_families?(santa.get_family_members))