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

	def same_last_name?(list)
		# last_name = list.select{|list| list["LAST_NAME"].length > 9 }
		# same = list.detect{|last_name| list.count(last_name) > 1}
		last_name = list.group_by { |h| h["LAST_NAME"] }.values.select { |a| a.size > 1}.flatten
		return false if last_name.empty?
		list
	end

	def move_names(list)
		last_names = same_last_name?(list)

		return list if last_names == false
			shuffled_list = list.shuffle
			shuffled_list
 		end

	def in_a_row?(list)
		list_of_names = move_names(list)

		list_of_names.each_cons(2) do |hash, next_hash|
			return true if hash["LAST_NAME"] == next_hash["LAST_NAME"]
		end 
		list_of_names
	end

	def assign_santa(list)
		in_a_row = in_a_row?(list)

		unless in_a_row == true
			in_a_row.each_cons(2) do |hash, next_hash|
				puts "#{hash["FIRST_NAME"]} is Secret Santa to #{next_hash["FIRST_NAME"]}"
			end
			first_name = in_a_row[0]
			last_name = in_a_row[-1]
			puts "#{last_name["FIRST_NAME"]} is Secret Santa to #{first_name["FIRST_NAME"]}"
		end
		true
	end


end

secret_santa = SecretSanta.new
# secret_santa.same_last_name?(secret_santa.open)
# secret_santa.in_a_row?(secret_santa.open)
secret_santa.assign_santa(secret_santa.open)


