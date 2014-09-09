class FindSantas

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
			  potential = random_list.select{ |other_person| person.swap_santa(person, other_person) }
			  raise if potential.empty?
				  other_person = potential [ rand ]
				  to_swap = person.assigned_santa
				  person.assigned_santa = other_person.assigned_santa
				  other_person.assigned_santa = to_swap
		  	end
	end
end