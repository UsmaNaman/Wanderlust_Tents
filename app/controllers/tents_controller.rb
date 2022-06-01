class TentsController < ApplicationController

  def index
    @tents = Tent.all
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
