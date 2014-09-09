require './lib/person.rb'
require './lib/secret_santa.rb'
require './lib/find_santas.rb'

find_santas = FindSantas.new
secret_santa = SecretSanta.new(find_santas)
secret_santa.run!('./lib/example.csv')

