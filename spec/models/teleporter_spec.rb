# == Schema Information
# 
# Table name: teleporters
#
#  id         :integer          not null, primary key
#  status     :string(255)
#  broken     :boolean
#  num_seat   :integer
#  number     :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Teleporter, :type => :model do
  
  before { @teleporter = Teleporter.new(number: 1 , num_seat: 3)}

  subject { @teleporter }

  it { should have_db_column(:status) }
  it { should have_db_column(:broken) }
  it { should have_db_column(:num_seat) }
  it { should have_db_column(:number).with_options(null: false) }
  
  it { should have_db_index(:number) }

  it { should respond_to(:number) }
  it { should respond_to(:status) }
  it { should respond_to(:broken) }
  it { should respond_to(:num_seat) }

  it { should be_valid }

  describe "Validation" do 
    it { should validate_presence_of(:num_seat) }
    it { should validate_presence_of(:number)}
    it { should validate_numericality_of(:num_seat).is_greater_than(0).only_integer }
    it { should validate_numericality_of(:number).is_greater_than_or_equal_to(0) }
  end

  describe "Association" do
    it { should have_many(:teleports).dependent(:destroy) }
  end

end
