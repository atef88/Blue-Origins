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

class Teleport < ActiveRecord::Base
# Teleport is the Flight in our world

	has_many :tele_passes , dependent: :destroy
	has_many :passengers, through: :tele_passes 

	belongs_to :teleporter 
	belongs_to :destination , class_name: 'Point'
	belongs_to :departure , class_name: 'Point'


	validates_uniqueness_of :teleporter_id, :scope => [:time, :date]
	validates :teleporter_id , presence: true
	validates :departure_id, presence: true
	validates :destination_id , presence: true
	validates :time , presence: true
	validates :date , presence: true
	validate :destination_not_equal_departue

	before_create :get_avail_seat
	before_validation :adjust_time



	protected

		def get_avail_seat
			self.avail_seat = self.teleporter.num_seat if self.teleporter
		end

		def destination_not_equal_departue
			errors.add(:destination, "can't be the same as departure") if destination_id == departure_id
		end

		def adjust_time
			self.time = self.time.strftime("%I:%M %p") if self.time
		end

end
