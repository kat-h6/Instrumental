class BookingsController < ApplicationController

  def new
    @instrument = Instrument.find(params[:instrument_id])
    @booking = Booking.new
  end

  def create
    @instrument = Instrument.find(params[:instrument_id])
    @booking = Booking.new(booking_params)
    @booking.instrument = @instrument
    @booking.renter = current_user
    @booking.price = @instrument.rate * (@booking.end_date - @booking.start_date).to_i
    if @booking.save
      redirect_to rentals_path
    else
      render :new
    end
  end

 
  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to orders_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to orders_path
  end

  private

  def booking_params
    params.require(:booking).permit(:price, :start_date, :end_date, :details, :status)
  end
end
