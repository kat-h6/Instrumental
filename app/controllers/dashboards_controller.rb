class DashboardsController < ApplicationController
  # Instruments that I own
  def orders
    @instruments = Instrument.where(owner: current_user)
    @instruments_with_bookings = @instruments.joins(:bookings).where.not(bookings:{id: nil})
  end

  # Bookings that I've made
  def rentals
    @bookings = Booking.where(renter: current_user)
  end

end
