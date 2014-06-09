class Reservation
	# i have insisted to do the reservation process in the database to make the controller lighter 
	# and to be sure not to make records conflicts
	include ActiveModel::Validations
	include ActiveModel::Model

	validates_presence_of :passenger_name , :teleport

	def initialize(attributes={})
		super
		self.passenger_name = attributes[:passenger_name]
		self.teleport = attributes[:teleport]
		@errors = ActiveModel::Errors.new(self)
	end

	attr_accessor :passenger_name, :teleport
	attr_reader :errors

	def read_attribute_for_validation(attr)
    	send(attr)
  	end


	def create!
		begin
			self.teleport.class.transaction do
				@passenger = self.teleport.passengers.create(:name => self.passenger_name)
				@passenger.save!
				self.teleport.update!(avail_seat: @teleport.avail_seat - 1)
			end
		rescue
			if @passenger
				@errors.add(:name , @passenger.errors.messages[:name][0] ) 
			else 
				@errors.add(:teleport , "is full")
			end
			return false
		end
		return true
	end



	def destroy
		@teleport.class.transaction do
			@passenger = @teleport.passengers.where(:name => @passenger_name)
			@teleport.passengers.destroy(@passenger)
			Passenger.destroy(@passenger)
			@teleport.update!(avail_seat: @teleport.avail_seat + 1)
		end
	end

end