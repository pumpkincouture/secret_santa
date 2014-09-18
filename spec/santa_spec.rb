require_relative '../lib/secret_santa'
require_relative '../lib/person'
require_relative 'spec_helper'

describe SecretSanta do 
	list = '../lib/test_list.csv'

	before :each do
		@secret_santa = SecretSanta.new
	end

	it "returns people list" do
	  expect(@secret_santa.get_people_list(list)[0].first).to eq("Albus")
	  expect(@secret_santa.get_people_list(list)[1].first).to eq("Jacob")
	end

	it "returns boolean based on the number of families in the list" do
		expect{@secret_santa.print_error([])}.to_not raise_error
		expect{@secret_santa.print_error(@secret_santa.get_family_members)}.to raise_error
	end

	it "returns a random santa list" do
		get_list = @secret_santa.get_people_list(list)
		get_random_list = @secret_santa.get_people_list(list)

	  expect(@secret_santa.assign_random_santa(get_list, get_random_list)[0].first).to eq("Albus")
	  expect(@secret_santa.assign_random_santa(get_list, get_random_list)[0].assigned_santa.first).to eq("Hermione")
	  expect(@secret_santa.assign_random_santa(get_list, get_random_list)[1].first).to eq("Jacob")
	  expect(@secret_santa.assign_random_santa(get_list, get_random_list)[1].assigned_santa.first).to eq("Albus")
	end

	it "returns a correct matchup" do
		get_list = @secret_santa.get_people_list(list)
		get_random_list = @secret_santa.get_people_list(list)
		random_santa = @secret_santa.assign_random_santa(get_list, get_random_list)
		
		# expect(@secret_santa.assign_correct_santa(random_santa).first).to eq("Albus")
		p @secret_santa.assign_correct_santa(random_santa)[0].first
		# p assign_correct[0].assigned_santa.first
		# expect(assign_correct[0].assigned_santa.first).to_not eq("Harry")			
	end		
end