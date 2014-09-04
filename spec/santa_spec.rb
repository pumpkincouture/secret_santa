require_relative '../lib/secret_santa.rb'
require_relative '../lib/person.rb'
require_relative 'spec_helper.rb'


describe SecretSanta do 
	list = './lib/test_list.csv'

	before :each do
		@secret_santa = SecretSanta.new
		# @people = Person.new(row)
	end

	it "returns people list" do
	  expect(@secret_santa.get_people_list(list)[0].first).to eq("Albus")
	  expect(@secret_santa.get_people_list(list)[1].first).to eq("Jacob")
	end

	it "returns boolean based on the number of families in the list" do
		list_length = 5
		allow(@secret_santa).to receive(:get_family_members).and_return([ @secret_santa.get_people_list(list)[2], 
																																		  @secret_santa.get_people_list(list)[3],
																																		  @secret_santa.get_people_list(list)[4] ])

		expect(@secret_santa.how_many_families?([])).to be false
		expect(@secret_santa.how_many_families?(@secret_santa.get_family_members)).to be true
	end

	it "returns a random santa list" do
		@secret_santa.santa_shuffled = [ @secret_santa.get_people_list(list)[1], 
																		 @secret_santa.get_people_list(list)[4],
															       @secret_santa.get_people_list(list)[2], 
															       @secret_santa.get_people_list(list)[3],
															       @secret_santa.get_people_list(list)[0] ]

		expect(@secret_santa.assign_random_santa[0].first).to eq("Albus")
		expect(@secret_santa.assign_random_santa[0].assigned_santa.first).to eq("Jacob")
		expect(@secret_santa.assign_random_santa[1].first).to eq("Jacob")
		expect(@secret_santa.assign_random_santa[1].assigned_santa.first).to eq("Hermione")
		expect(@secret_santa.assign_random_santa[2].first).to eq("Harry")
		expect(@secret_santa.assign_random_santa[2].assigned_santa.first).to_not eq("Harry")
	end

	it "returns a correct matchup" do
	  @secret_santa.santa_shuffled = [ @secret_santa.get_people_list(list)[1], 
																		 @secret_santa.get_people_list(list)[4],
															       @secret_santa.get_people_list(list)[2], 
															       @secret_santa.get_people_list(list)[3],
															       @secret_santa.get_people_list(list)[0] ]

		@secret_santa.assign_random_santa[0].assigned_santa.first = "Harry"
		@secret_santa.assign_random_santa[0].assigned_santa.last = "Dumbledore"

		method = @secret_santa.assign_correct_santa(@secret_santa.assign_random_santa)		

		expect(method[0].assigned_santa.first).to_not eq("Harry")			
	end							       
end