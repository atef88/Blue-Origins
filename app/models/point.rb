# == Schema Information
# 
# Table name: points
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Point < ActiveRecord::Base
	 
	validates :name , uniqueness: { case_sensitive: false }  , presence: true

	has_many :departures , :class_name =>'Teleport' , dependent: :destroy , :foreign_key => 'departure_id'
	has_many :destinations , :class_name => 'Teleport' , dependent: :destroy , :foreign_key => 'destination_id'

end
