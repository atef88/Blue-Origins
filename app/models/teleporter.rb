# == Schema Information
#
# Table name: teleporters
#
#  id         :integer          not null, primary key
#  number     :integer			not null
#  status     :string(255)
#  broken     :boolean
#  num_seat   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Teleporter < ActiveRecord::Base
	has_many :teleports, dependent: :destroy

	validates :num_seat , presence: true
	validates_numericality_of :num_seat, greater_than: 0, only_integer: true

	# teleporter.number is a unique number for the teleporter (like a airplane number)
	validates :number , presence: true , uniqueness: true
	validates_numericality_of :number, greater_than_or_equal_to: 0
end
