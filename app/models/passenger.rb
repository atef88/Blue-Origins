# == Schema Information
#
# Table name: passengers
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Passenger < ActiveRecord::Base
	before_save { self.name = name.downcase }
	
	has_one :tele_pass , dependent: :destroy
	has_one :teleport , through: :tele_pass

	validates :name , presence: true , uniqueness: { case_sensitive: false } , length: { maximum: 50 }

end
