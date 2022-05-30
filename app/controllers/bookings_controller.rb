class BookingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @booking = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.user = current_user
    @booking.tent = Tent.find(params[:boat_id])
    if @booking.save
      redirect_to booking_path(@booking)
    else
      redirect_to tent_path(@tent)
    end
  end
end
