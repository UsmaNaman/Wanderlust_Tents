class TentsController < ApplicationController

  def index
    @tents = Tent.all
    @markers = @tents.geocoded.map do |tent|
      {
        lat: tent.latitude,
        lng: tent.longitude,
        info_window: render_to_string(partial: "info_window", locals: { tent: tent }),
        image_url: helpers.asset_path("tipi_map_logo.png")
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
    @tent.user = current_user
    if @tent.save
      redirect_to tent_path(@tent)
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
