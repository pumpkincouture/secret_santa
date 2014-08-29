require './lib/person.rb'
require './lib/secret_santa.rb'

santa = SecretSanta.new
santa.people_list
santa.random_list
santa.assign_random_santa
