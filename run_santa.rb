require './lib/person.rb'
require './lib/secret_santa.rb'

secret_santa = SecretSanta.new
secret_santa.run!('./lib/example.csv')

