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

class TelePass < ActiveRecord::Base
# TelePass is a reservation

	belongs_to :passenger
	belongs_to :teleport 

	validates :passenger_id , presence: true
	validates_uniqueness_of :passenger_id, message: 'Sorry , Passenger already has a reservation'
	validates :teleport_id , presence: true
	validate :teleporter_is_not_full


	protected

	def teleporter_is_not_full
		# i have not restricted the maximum seats to "3" , i have made it rely on teleporter num_seat(var)
		# in case in future we improved our teleporter and changed the maximum seats
		errors.add(:teleport,"teleporter has reached its maximum seats #{self.teleport.passengers.size}") if self.teleport.avail_seat <= 0 unless teleport_id==nil
	end

end
