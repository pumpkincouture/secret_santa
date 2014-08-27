require 'csv'

class SecretSanta
	attr_reader :santa_list

	def open
		f = File.open("/Users/administrator/Desktop/Personal/8th_Light/Apprenticeship/secret_santa/lib/example.csv")
		csv_data = CSV.read '/Users/administrator/Desktop/Personal/8th_Light/Apprenticeship/secret_santa/lib/example.csv'
		headers = csv_data.shift.map {|i| i.to_s }
		string_data = csv_data.map {|row| row.map {|cell| cell.to_s} }
		hash_names = string_data.map {|row| Hash[*headers.zip(row).flatten] }
		# CSV.foreach('example.csv', :headers => true) do |csv_obj|
		# 	p csv_obj
		# end
		hash_names
	end

	def assign_santa(list)
			pairs = []

			list.each_cons(2) do |hash, next_hash|
			  pairs << [hash["FIRST_NAME"] + " " + hash["LAST_NAME"] + " + " + next_hash["FIRST_NAME"] + " " + next_hash["LAST_NAME"]] 
			end
			first_name = list[0]
			last_name = list[-1]
			pairs << [last_name["FIRST_NAME"] + " " + last_name["LAST_NAME"] + " + " + first_name["FIRST_NAME"] + " " + first_name["LAST_NAME"]] 
		pairs
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
	
end

# secret_santa = SecretSanta.new
# secret_santa.assign_santa(secret_santa.open)
# secret_santa.refine_pairs(assign_santa(secret_santa.open))


