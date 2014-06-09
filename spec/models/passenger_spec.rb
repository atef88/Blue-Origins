# == Schema Information
#
# Table name: passengers
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Passenger, :type => :model do
  
  before { @passenger = Passenger.new(name: "passenger1")}

  subject { @passenger }

  it { should have_db_column(:name).with_options(null: false) }
  it { should have_db_index(:name).unique(true) }

  it { should respond_to(:name) }

  describe "Validation" do 
    it { should be_valid }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }

    describe "When passenger name is too long" do
    	before { @passenger.name = "x" * 51 }
    	it { should_not be_valid }
    end
  end

  describe "Association" do 

    it { should have_one(:tele_pass).dependent(:destroy) }
    it { should have_one(:teleport).through(:tele_pass) }
    
  end

end
