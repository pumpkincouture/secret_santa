require_relative '../lib/secret_santa'
require_relative '../lib/person'
require_relative 'spec_helper'

describe FindSantas do
	list = '../lib/test_list.csv'
	
	before :each do
		@find_santas = FindSantas.new
		@secret_santa = SecretSanta.new(@find_santas)
	end

  it "returns a random santa list" do
		get_list = @secret_santa.get_people_list(list)
		get_random_list = @secret_santa.get_people_list(list)

	  expect(@find_santas.assign_random_santa(get_list, get_random_list)[0].first).to eq("Albus")
	  expect(@find_santas.assign_random_santa(get_list, get_random_list)[0].assigned_santa.first).to eq("Hermione")
	  expect(@find_santas.assign_random_santa(get_list, get_random_list)[1].first).to eq("Jacob")
	  expect(@find_santas.assign_random_santa(get_list, get_random_list)[1].assigned_santa.first).to eq("Albus")
	end

	it "returns a correct matchup" do
		get_list = @secret_santa.get_people_list(list)
		get_random_list = @secret_santa.get_people_list(list)
		random_santa = @find_santas.assign_random_santa(get_list, get_random_list)
		
		# expect(@secret_santa.assign_correct_santa(random_santa).first).to eq("Albus")
		p @find_santas.assign_correct_santa(random_santa)[0].first
		# p assign_correct[0].assigned_santa.first
		# expect(assign_correct[0].assigned_santa.first).to_not eq("Harry")			
	end		
end