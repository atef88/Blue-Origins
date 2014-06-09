class SearchController < ApplicationController


  def index
    @destinations = Point.all
    @departures = Point.all
  end

  def show
  	@results = Teleport.where(:departure_id => params[:search][:departure_id],:destination_id =>params[:search][:destination_id])
  	respond_to do |format|
  		format.js
  	end
  end

  def reserve
    
  	@teleport = Teleport.find(params[:id])
  	@reservation = Reservation.new(:passenger_name => params[:name],:teleport => @teleport)
  	respond_to do |format|
      if @reservation.create!
  		  format.html { redirect_to root_path , notice: 'You have successfully reserved a seat.'}
      else
        @destinations = Point.all
        @departures = Point.all
        format.html { render action: 'index' }
      end 
  	end
  end

end
