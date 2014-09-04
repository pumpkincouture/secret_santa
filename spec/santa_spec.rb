require_relative '../lib/secret_santa.rb'
require_relative '../lib/person.rb'
require_relative 'spec_helper.rb'

describe SecretSanta do 
	let (:santa_list)  { "Albus,Dumbledore,<adumbledore@hogwarts.org>
											 Jacob,Berz,<jberz@hogwarts.org>
											 Harry,Dumbledore,<hpotter@hogwarts.org>
											 Ron,Weasley,<rweasly@hogwarts.org>
											 Hermione,Malfoy,<hgranger@hogwarts.org>
											 Draco,Malfoy,<dmalfoy@hogwarts.org>
											 Cho,Malfoy,<cchang@hogwarts.org>
											 Damien,Malfoy,<dmalfoy@hogwarts.org>
											 James,Franco,<jfranco@hogwarts.org>" }
	
	before :each do
		@secret_santa = SecretSanta.new
		@people = Person.new(santa_list)
	end

	it "returns people list" do
		expect(@secret_santa.people_list[0].first).to eq("Albus")
		expect(@secret_santa.people_list[1].first).to eq("Jacob")

	end

	it "returns boolean based on the number of families in the list" do
		list_length = 4
		allow(secret_santa).to receive(:get_family_members).and_return([])
		expect(@secret_santa.how_many_families).to be false
	end
	
end