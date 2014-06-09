# == Schema Information
#
# Table name: points
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#
  
require 'spec_helper'

describe Point, :type => :model do
  
  before { @point = Point.new(name: "point")}
  subject { @point }

  it { should have_db_column(:name) }

  it { should be_valid }
  it { should respond_to(:name) }

  describe "Validation" do
  	it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  describe "Association" do 
  	 it { should have_many(:departures).class_name('Teleport').with_foreign_key('departure_id').dependent(:destroy) }
  	 it { should have_many(:destinations).class_name('Teleport').with_foreign_key('destination_id').dependent(:destroy) }
  end

end