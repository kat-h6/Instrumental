class BookingsController < ApplicationController

	def new
		@booking = Booking.new
	end

	def create
	@booking = Booking.new(booking_params)
	if @booking.save
	  redirect_to instrument_path(@booking.instrument)
	else
	  render :new
	end
   end

   private

   def booking_params
   	  params.require(:booking).permit(:price, :start_date, :end_date, :details)
   end

end
