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

	it "returns matching name arrays" do
		matches = [ {"FIRST_NAME"=>"Albus", "LAST_NAME"=>"Potter", "EMAIL"=>"<adumbledore@hogwarts.org>"}, 
								{"FIRST_NAME"=>"Harry", "LAST_NAME"=>"Potter", "EMAIL"=>"<hpotter@hogwarts.org>"}, ]
		expect(@secret_santa.same_last_name?(matches)).to eq(matches)
	end

	it "moves similarly named people to opposite ends of list" do
		family_list = [ {"FIRST_NAME"=>"Albus", "LAST_NAME"=>"Dumbledore", "EMAIL"=>"<adumbledore@hogwarts.org>"}, 
											{"FIRST_NAME"=>"Harry", "LAST_NAME"=>"Potter", "EMAIL"=>"<hpotter@hogwarts.org>"}, 
											{"FIRST_NAME"=>"Ron", "LAST_NAME"=>"Weasley", "EMAIL"=>"<rweasly@hogwarts.org>"}, 
											{"FIRST_NAME"=>"Hermione", "LAST_NAME"=>"Granger", "EMAIL"=>"<hgranger@hogwarts.org>"}, 
											{"FIRST_NAME"=>"Draco", "LAST_NAME"=>"Granger", "EMAIL"=>"<dmalfoy@hogwarts.org>"} ]

		new_list = [{"FIRST_NAME"=>"Draco", "LAST_NAME"=>"Granger", "EMAIL"=>"<dmalfoy@hogwarts.org>"}, 
								{"FIRST_NAME"=>"Albus", "LAST_NAME"=>"Dumbledore", "EMAIL"=>"<adumbledore@hogwarts.org>"}, 
								{"FIRST_NAME"=>"Harry", "LAST_NAME"=>"Potter", "EMAIL"=>"<hpotter@hogwarts.org>"}, 
								{"FIRST_NAME"=>"Ron", "LAST_NAME"=>"Weasley", "EMAIL"=>"<rweasly@hogwarts.org>"}, 
								{"FIRST_NAME"=>"Hermione", "LAST_NAME"=>"Granger", "EMAIL"=>"<hgranger@hogwarts.org>"}]
		expect(@secret_santa.move_names(family_list)).to eq(new_list)
	end

	it "returns the list if there is no same last name" do
		expect(@secret_santa.move_names(santa_list)).to eq(santa_list)
	end

	pending "assigns a santa" do
		assigned = santa_list.shuffle
		expect(@secret_santa.shuffle_people(santa_list)).to eq(assigned)
	end
end