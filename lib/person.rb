class Person
	attr_accessor :first, :last, :email
	attr_accessor :assigned_santa

	def initialize(list)
		  @first = list[0]
		  @last = list[1]
		  @email = list[2]
	end

	def swap_santa(person, other_person)
	  person.assigned_santa.legit_santa(other_person) && other_person.assigned_santa.legit_santa(person)
	end

	def legit_santa(potential)
		  @last != potential.last
	end

	def not_self(potential)
		 @first != potential.first
	end
end