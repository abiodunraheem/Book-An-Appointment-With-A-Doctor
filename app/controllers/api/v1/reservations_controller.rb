class Api::V1::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user_id: params[:user_id])
    render json: @reservations
  end

  def show
    @reservation = Reservation.find(params[:id])
    render json: @reservation
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = params[:user_id]
    if @reservation.save
      render json: @reservation
    else
      render json: @reservation.errors
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date, :city, :doctor_id)
  end
end
