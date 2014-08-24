require_relative '../lib/secret_santa.rb'
require_relative 'spec_helper.rb'

describe SecretSanta do 
	let (:santa_list)  { [ {"FIRST_NAME"=>"Albus", "LAST_NAME"=>"Dumbledore", "EMAIL"=>"<adumbledore@hogwarts.org>"}, 
											   {"FIRST_NAME"=>"Harry", "LAST_NAME"=>"Potter", "EMAIL"=>"<hpotter@hogwarts.org>"}, 
											   {"FIRST_NAME"=>"Ron", "LAST_NAME"=>"Weasley", "EMAIL"=>"<rweasly@hogwarts.org>"}, 
											   {"FIRST_NAME"=>"Hermione", "LAST_NAME"=>"Granger", "EMAIL"=>"<hgranger@hogwarts.org>"}, 
											   {"FIRST_NAME"=>"Draco", "LAST_NAME"=>"Malfoy", "EMAIL"=>"<dmalfoy@hogwarts.org>"} ] }
	
	before :each do
		@secret_santa = SecretSanta.new
	end

	it "returns hash data" do
		expect(@secret_santa.open).to eq(santa_list)
	end

	it "checks same last name" do
		expect(@secret_santa.same_last_name?(santa_list)).to be false
	end

	it "checks if there are matching names" do
		santa_list = [ {"FIRST_NAME"=>"Albus", "LAST_NAME"=>"Dumbledore", "EMAIL"=>"<adumbledore@hogwarts.org>"}, 
										 {"FIRST_NAME"=>"Harry", "LAST_NAME"=>"Potter", "EMAIL"=>"<hpotter@hogwarts.org>"}, 
										 {"FIRST_NAME"=>"Ron", "LAST_NAME"=>"Weasley", "EMAIL"=>"<rweasly@hogwarts.org>"}, 
										 {"FIRST_NAME"=>"Hermione", "LAST_NAME"=>"Granger", "EMAIL"=>"<hgranger@hogwarts.org>"}, 
										 {"FIRST_NAME"=>"Draco", "LAST_NAME"=>"Malfoy", "EMAIL"=>"<dmalfoy@hogwarts.org>"} ]
		expect(@secret_santa.same_last_name?(santa_list)).to be false
	end

	it "returns shuffled list" do
		family_list = [ {"FIRST_NAME"=>"Albus", "LAST_NAME"=>"Dumbledore", "EMAIL"=>"<adumbledore@hogwarts.org>"}, 
										{"FIRST_NAME"=>"Harry", "LAST_NAME"=>"Potter", "EMAIL"=>"<hpotter@hogwarts.org>"}, 
										{"FIRST_NAME"=>"Ron", "LAST_NAME"=>"Weasley", "EMAIL"=>"<rweasly@hogwarts.org>"}, 
										{"FIRST_NAME"=>"Hermione", "LAST_NAME"=>"Granger", "EMAIL"=>"<hgranger@hogwarts.org>"}, 
										{"FIRST_NAME"=>"Draco", "LAST_NAME"=>"Granger", "EMAIL"=>"<dmalfoy@hogwarts.org>"} ]
		new_list = family_list.shuffle
		expect(@secret_santa.move_names(family_list)).to_not eq(family_list)
	end

	it "returns the list if there is no same last name" do
		expect(@secret_santa.move_names(santa_list)).to eq(santa_list)
	end

	it "assigns a santa if there are no family members" do
		expect(@secret_santa.assign_santa(santa_list)).to be true
	end
end