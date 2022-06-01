class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    # @tent = Tent.new
    # @bookings = Booking.all
    @tents = Tent.last(3)
  end
end
