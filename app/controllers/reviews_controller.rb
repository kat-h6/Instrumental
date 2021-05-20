class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end
  def show
    @review = Review.find(params[:id])
  end

  def new    
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # we need `booking_id` to associate review with corresponding booking
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    @review.save
    
    redirect_to booking_path(@booking)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to booking_path(@review.booking)
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :rating)
  end
end
