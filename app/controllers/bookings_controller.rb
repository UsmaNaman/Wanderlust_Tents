class BookingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookings = Booking.where(user_id: current_user.id)
    @tent = Tent.new
  end

  def show
    set_booking
    @tent = @booking.tent
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.user = current_user
    @booking.tent = Tent.find(params[:tent_id])
    if @booking.save
      redirect_to booking_path(@booking)
    else
      redirect_to tent_path(@tent)
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
