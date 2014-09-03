require './lib/person.rb'
require './lib/secret_santa.rb'

santa = SecretSanta.new
santa.people_list
santa.random_list

unless santa.how_many_families
    santa.assign_random_santa
	  santa.print_assigned
end
santa.print_error