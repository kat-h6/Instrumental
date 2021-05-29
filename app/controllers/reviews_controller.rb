class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end
  def show
    @review = Review.find(params[:booking_id])
  end

  def new    
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    @review.save
    @instrument = @booking.instrument.id

    
    redirect_to instrument_path(@instrument)
  end

  def destroy
    @review = Review.find(params[:renter_id])
    @review.destroy
    redirect_to booking_path(@review.booking)
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :rating)
  end
end
