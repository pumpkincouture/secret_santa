require './lib/person.rb'
require './lib/secret_santa.rb'

santa = SecretSanta.new
santa.play!('./lib/example.csv')

