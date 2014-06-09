# == Schema Information 
#
# Table name: tele_passes
#
#  id           :integer          not null, primary key
#  teleport_id  :integer
#  passenger_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

require 'spec_helper'
 
describe TelePass, :type => :model do
  let(:passenger){FactoryGirl.create(:passenger)}
  let(:teleporter) {FactoryGirl.create(:teleporter)}
  let(:departure) {FactoryGirl.create(:departure)}
  let(:destination) {FactoryGirl.create(:destination)}
  let(:teleport) {FactoryGirl.create(:teleport,teleporter: teleporter,departure: departure,destination: destination )}
  let!(:tele_pass){FactoryGirl.create(:tele_pass,passenger: passenger,teleport: teleport)}

  subject {tele_pass}

  it { should have_db_column(:passenger_id) }
  it { should have_db_column(:teleport_id) }
  it { should have_db_index(:passenger_id).unique(true) }
  it { should have_db_index(:teleport_id) }

  it{should be_valid}

  it{should respond_to(:passenger)}
  it{should respond_to(:teleport)}


  describe "Validations: " do

  	it { should validate_presence_of(:passenger_id) }
    it { should validate_presence_of(:teleport_id) }
  	it { should validate_uniqueness_of(:passenger_id).with_message('Sorry , Passenger already has a reservation') }

    describe "should validate that there are available seats" do
      before do
        tele_pass.teleport.avail_seat = 0
      end
      it { should_not be_valid }
    end

  end

  describe "Association" do
      it { should belong_to(:passenger) }
      it { should belong_to(:teleport) }
  end 

end
