require_relative '../lib/secret_santa.rb'
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

	pending "returns hash data" do
		expect(@secret_santa.open).to eq(santa_list)
	end

	it "accepts a list and assigns pairs" do
		family_list = [ {"FIRST_NAME"=>"Albus", "LAST_NAME"=>"Dumbledore", 
	  								 "EMAIL"=>"<adumbledore@hogwarts.org>"}, 
										{"FIRST_NAME"=>"Harry", "LAST_NAME"=>"Potter", 
										 "EMAIL"=>"<hpotter@hogwarts.org>"}, 
										{"FIRST_NAME"=>"Ron", "LAST_NAME"=>"Weasley", 
										 "EMAIL"=>"<rweasly@hogwarts.org>"}, 
										{"FIRST_NAME"=>"Hermione", "LAST_NAME"=>"Granger", 
										 "EMAIL"=>"<hgranger@hogwarts.org>"}, 
										{"FIRST_NAME"=>"Draco", "LAST_NAME"=>"Malfoy", 
										 "EMAIL"=>"<dmalfoy@hogwarts.org>"} ]
		expect(@secret_santa.assign_santa(family_list)).to_not eq(family_list)
	end		

	it "checks the hash to see if there are any matching pairs" do
		paired_list = [["Albus Dumbledore", "Draco Malfoy"], 
									 ["Harry Dumbledore", "Albus Dumbledore"], 
									 ["Ron Weasley", "Hermione Granger"], 
									 ["Hermione Granger", "Ron Weasley"], 
									 ["Draco Malfoy", "Harry Dumbledore"]]	
		expect(@secret_santa.matching_pairs?(paired_list)).to be true
	end

	it "shuffles pairs" do
		paired_list = [["Albus Dumbledore", "Draco Malfoy"], 
									 ["Harry Dumbledore", "Albus Dumbledore"], 
									 ["Ron Weasley", "Hermione Granger"], 
									 ["Hermione Granger", "Ron Weasley"], 
									 ["Draco Malfoy", "Harry Dumbledore"]]
	expect(@secret_santa.shuffle_list(paired_list)).to_not eq(paired_list)
	end
end