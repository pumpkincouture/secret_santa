require_relative '../lib/secret_santa'
require_relative '../lib/person'
require_relative 'spec_helper'
require_relative 'find_santa_mock'


describe SecretSanta do 
	list = '../lib/test_list.csv'

	before :each do
		@secret_santa = SecretSanta.new(@find_santas)
	end

	it "returns people list" do
	  expect(@secret_santa.get_people_list(list)[0].first).to eq("Albus")
	  expect(@secret_santa.get_people_list(list)[1].first).to eq("Jacob")
	end

	it "returns boolean based on the number of families in the list" do
		expect{@secret_santa.print_error([])}.to_not raise_error
		expect{@secret_santa.print_error(@secret_santa.get_family_members)}.to raise_error
	end
end