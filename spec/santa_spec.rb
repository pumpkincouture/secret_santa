require_relative '../lib/secret_santa.rb'
require_relative '../lib/person.rb'
require_relative 'spec_helper.rb'

describe SecretSanta do 
	let (:santa_list)  { [ {"FIRST_NAME"=>"Albus", "LAST_NAME"=>"Dumbledore", 
	  								      "EMAIL"=>"<adumbledore@hogwarts.org>"}, 
										     {"FIRST_NAME"=>"Harry", "LAST_NAME"=>"Potter", 
										      "EMAIL"=>"<hpotter@hogwarts.org>"}, 
										     {"FIRST_NAME"=>"Ron", "LAST_NAME"=>"Weasley", 
										      "EMAIL"=>"<rweasly@hogwarts.org>"}, 
										     {"FIRST_NAME"=>"Hermione", "LAST_NAME"=>"Granger", 
										      "EMAIL"=>"<hgranger@hogwarts.org>"}, 
										     {"FIRST_NAME"=>"Draco", "LAST_NAME"=>"Malfoy", 
										      "EMAIL"=>"<dmalfoy@hogwarts.org>"} ] }
	
	before :each do
		@secret_santa = SecretSanta.new
	end

	pending "returns people list" do
	  # rows = [#<Person:0x007f9dd39cf6f8 @first="Albus", @last="Dumbledore", @email="<adumbledore@hogwarts.org>", @assigned_santa=nil>, 
			# 			#<Person:0x007f9dd39cf450 @first="Harry", @last="Dumbledore", @email="<hpotter@hogwarts.org>", @assigned_santa=nil>, 
			# 			#<Person:0x007f9dd39cf1a8 @first="Ron", @last="Weasley", @email="<rweasly@hogwarts.org>", @assigned_santa=nil>, 
			# 			#<Person:0x007f9dd39cef00 @first="Hermione", @last="Granger", @email="<hgranger@hogwarts.org>", @assigned_santa=nil>, 
			# 			#<Person:0x007f9dd39cec58 @first="Draco", @last="Malfoy", @email="<dmalfoy@hogwarts.org>", @assigned_santa=nil>]
		expect(@secret_santa.people_list).to eq(rows)
	end

	
end