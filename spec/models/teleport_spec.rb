# == Schema Information
#
# Table name: teleports
#
#  id             :integer          not null, primary key
#  teleporter_id  :integer          not null
#  departure_id   :integer          not null
#  destination_id :integer          not null
#  time           :time
#  date           :date
#  avail_seat     :integer          default(3)
#  created_at     :datetime
#  updated_at     :datetime
#

require 'spec_helper'

describe Teleport, :type => :model do
  let!(:teleporter) {FactoryGirl.create(:teleporter)}
  let(:departure) {FactoryGirl.create(:departure)}
  let(:destination) {FactoryGirl.create(:destination)}
  let!(:teleport) {FactoryGirl.create(:teleport,teleporter: teleporter,departure: departure,destination: destination )}

  subject{teleport}


  it { should have_db_index([:teleporter_id,:date , :time]).unique(true) }
  it { should have_db_index([:departure_id, :destination_id]) }
  
  it { should have_db_column(:teleporter_id).with_options(null: false) }
  it { should have_db_column(:destination_id).with_options(null: false) }
  it { should have_db_column(:departure_id).with_options(null: false) }
  it { should have_db_column(:time)}
  it { should have_db_column(:date)}
  it { should have_db_column(:avail_seat) }

  it { should respond_to{:teleporter_id}}
  it { should respond_to{:departure_id}}
  it { should respond_to{:destination_id}}
  it { should respond_to{:time}}
  it { should respond_to{:date}}
  it { should respond_to{:avail_seat}}


  it {should be_valid}

  describe "Associations" do

    it { should have_many(:tele_passes).dependent(:destroy) }
    it { should have_many(:passengers).through(:tele_passes) }
    it { should belong_to(:teleporter) }
    it { should belong_to(:departure).class_name('Point') }
    it { should belong_to(:destination).class_name('Point') }

    describe "reservation" do

    	let!(:passenger){FactoryGirl.create(:passenger)}
    	let!(:tele_pass){FactoryGirl.create(:tele_pass,passenger: passenger,teleport: teleport)}

    	it "should have reservation(tele_pass) of passenger name" do
    		expect(teleport.passengers[0].name).to match passenger.name
    	end
      
    end

  end

  describe "Validation" do

    it { should validate_presence_of(:teleporter_id) }
    it { should validate_presence_of(:departure_id) }
    it { should validate_presence_of(:destination_id) }
    it { should validate_presence_of(:time) }
    it { should validate_presence_of(:date) }
    
  	it " should raise error when a dupliaction occure" do
  		expect{Teleport.create(teleport.dup)}.to raise_error
  	end

    describe "should validate destination_id is not equal to departure_id" do
      before{teleport.destination_id = teleport.departure_id}
      it{ should_not be_valid}
    end

  	describe "should get number of seats from teleporter before creation" do
  		it "should be matched" do
  			expect(teleport.avail_seat).to eq teleporter.num_seat
  		end
  	end


  end

end
