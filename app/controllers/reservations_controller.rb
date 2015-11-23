class ReservationsController < ApplicationController
  def index
  end

  def new
    @reservation = Reservation.new
    @property = params[:property_id]
  end

  def create
    Reservation.create reservation_params
    redirect_to root_path
  end

  def destroy
  end
  
  private
  def reservation_params
    params.require(:reservation).permit(:property_id, :user_id, :checkin, :checkout)
  end
end
