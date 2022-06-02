class TentsController < ApplicationController

  def index
    @tents = Tent.all
    @markers = @tents.geocoded.map do |tent|
      {
        lat: tent.latitude,
        lng: tent.longitude,
        info_window: render_to_string(partial: "info_window", locals: { tent: tent }),
        image_url: helpers.asset_url("https://cdn-icons.flaticon.com/png/512/3416/premium/3416917.png?token=exp=1654168573~hmac=041566149eb2b9ef035c6eaec93a6064")
      }
    end
  end

  def show
    @tent = Tent.find(params[:id])
    @booking = Booking.new
  end

  def new
    @tent = Tent.new
  end

  def create
    @tent = Tent.new(tent_params)
    if @tent.save
      redirect_to @tent
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @tent = Tent.find(params[:id])
    @tent.destroy
    redirect_to tents_path, status: :see_other
  end

  private

  def tent_params
    params.require(:tent).permit(:title, :description, :capacity, :location, :price, :photo)
  end
end
