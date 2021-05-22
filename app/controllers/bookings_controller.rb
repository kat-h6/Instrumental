class BookingsController < ApplicationController

  def new
    @instrument = instrument.find(params[:instrument_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @instrument = instrument.find(params[:instrument_id])
    @instrument.user_id = current_user.id
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
