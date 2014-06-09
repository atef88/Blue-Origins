require "spec_helper"
require "reservation"

describe Reservation do 
  let(:passenger){FactoryGirl.create(:passenger)}
  let(:teleporter) {FactoryGirl.create(:teleporter)}
  let(:departure) {FactoryGirl.create(:departure)}
  let(:destination) {FactoryGirl.create(:destination)}
  let(:teleport) {FactoryGirl.create(:teleport,teleporter: teleporter,departure: departure,destination: destination )}
  let!(:reservation) {FactoryGirl.build(:reservation ,teleport: teleport )} 

  subject{reservation}

  it { should respond_to{:create!}}
  it { should respond_to{:destroy}} 
  it { should validate_presence_of(:passenger_name) }
  it { should validate_presence_of(:teleport)}


  context Teleport do
  	it "should have a passenger with name(test)" do
  		reservation.create!
  		expect(teleport.passengers.first.name).to eq "test"
  	end
  end

  context Passenger do
  	it "should create a passenger when reservation made" do
  		reservation.create!
  		expect(Passenger.first.name).to eq "test"
  	end
  end

  context TelePass do
  	it "should creae a tele_pass record for association" do
  		reservation.create!
  		expect(teleport.tele_passes.first.passenger_id).to eq (Passenger.find_by_name("test").id)
  	end
  end

end