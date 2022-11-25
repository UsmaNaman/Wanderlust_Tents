class BookingsController < ApplicationController
  before_action :authenticate_user!

  def confirmation
    @booking = Booking.find(params[:booking_id])
  end

  def index
    @bookings = Booking.where(user_id: current_user.id)
    # @tent = Tent.new
    @past_bookings = current_user.bookings.order(start_date: :asc)
    @future_bookings = current_user.bookings.order(start_date: :desc)
  end

  def show
    set_booking
    @tent = @booking.tent
    @markers = [
      {
        lat: @tent.latitude,
        lng: @tent.longitude,
        info_window: render_to_string(partial: "tents/info_window", locals: { tent: @tent }),
        image_url: helpers.asset_path("tipi_map_logo.png")
      }
    ]
  end

  def new
    @booking = Booking.new
  end

  def create
    @tent = Tent.find(params[:tent_id])
    @booking = Booking.new(booking_params)
    @booking.tent = @tent
    @booking.user = current_user
    # @booking.status = "Pending Host Validation"
    if @booking.save!
      redirect_to booking_confirmation_path(@booking)
    else
      redirect_to tent_path(@tent), :unprocessable_entity
    end
  end

  def update
    set_booking
    @booking.status = "Pending Host Validation."
    @booking.save
    redirect_to booking_path(@booking)
  end

  def destroy
    set_booking
    @booking.destroy
    redirect_to tent_path(@booking.tent), status: :see_other
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
