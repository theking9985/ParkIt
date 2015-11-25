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
  
end
