require 'csv'

class SecretSanta
	attr_reader :santa_list

	def open
		f = File.open("example.csv")
		csv_data = CSV.read 'example.csv'
		headers = csv_data.shift.map {|i| i.to_s }
		string_data = csv_data.map {|row| row.map {|cell| cell.to_s} }
		hash_names = string_data.map {|row| Hash[*headers.zip(row).flatten] }
		hash_names
	end

	def assign_santa(list)

		pairs = []
			
			list.each do |hash|
			potential = [hash["FIRST_NAME"] + " " + hash["LAST_NAME"]]
			pairs << potential
			end

			pairs.each do |array|
						random_array = list[rand]
						first_name = random_array["FIRST_NAME"]
						last_name = random_array["LAST_NAME"]
						name = ""
						name += first_name + " "
						name += last_name

				array << name
			end

		p pairs
	end

	def refine_pairs(list)

		new_sentence = []

	  list.each do |sub_array|
		  sub_array.each do |sentence|
				  split = sentence.split(" ")
				  new_sentence << split
			end
		end
		new_sentence
	end

	def matching_pairs?(list)

		list.each do |array|
		  return true if array[1] == array[4]
		end
		false
	end

	def shuffle_list(refined_list)
		random_list = refined_list.shuffle
		random_array = random_list[rand]
		first_name = random_array[3]
		last_name = random_array[4]
		original_first = ""
		original_last = ""
		swap_first = ""
		swap_last = ""
		refined_list.each do |array|
			if array[1] == array[4]
					# p array[3]
					# p first_name
					array[3], first_name = first_name, array[3]
					array[4], last_name = last_name, array[4]
					original_first += first_name
					original_last += last_name
					swap_first += array[3]
					swap_last += array[4]
					# p swap_first
					# p swap_last
			elsif array[3] == swap_first
					array[3] = original_first
					array[4] = original_last
			else
				 refined_list
			end
		
					# array[4], last_name = last_name, array[4]
			# else
			# 	 array[3], first_name = first_name, array[3]
		end
		 refined_list
	end
end

secret_santa = SecretSanta.new
secret_santa.open
secret_santa.assign_santa(secret_santa.open)
# secret_santa.refine_pairs(secret_santa.assign_santa(secret_santa.open))
# secret_santa.matching_pairs?(secret_santa.refine_pairs(secret_santa.assign_santa(secret_santa.open)))
# secret_santa.shuffle_list(secret_santa.refine_pairs(secret_santa.assign_santa(secret_santa.open)))

