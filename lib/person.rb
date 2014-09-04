require_relative 'secret_santa.rb'

class Person
	attr_reader :first, :last, :email
	attr_accessor :assigned_santa

	def initialize(list)
		  @first = list[0]
		  @last = list[1]
		  @email = list[2]
		  @assigned_santa = assigned_santa
	end

	def legit_santa(potential)
		  @last != potential.last
	end

	def not_self(potential)
		 @first != potential.first
	end
end