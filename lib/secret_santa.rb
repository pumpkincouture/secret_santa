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
		last_name
	end

	def move_names(list)
		last_names = same_last_name?(list)

		unless last_names == false
		  odd_names = last_names.select.each_with_index { |hash, position| position.odd? } 
		  even_names = last_names.select.each_with_index {|hash, position| position.even? }
		
		  odd_names.each do |hash|
			  list.unshift(hash)
		  end

		  even_names.each do |hash|
			  list << hash
		  end
		 end
 		list.uniq
	end

	def shuffle_people(list)
		list.shuffle
	end
end

secret_santa = SecretSanta.new
secret_santa.same_last_name?(secret_santa.open)
secret_santa.move_names(secret_santa.open)
