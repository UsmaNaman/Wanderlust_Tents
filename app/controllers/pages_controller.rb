class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @tent = Tent.new
    @bookings = Booking.all
  end
end
