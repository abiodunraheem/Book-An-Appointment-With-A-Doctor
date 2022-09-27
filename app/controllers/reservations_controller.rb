class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      render json: { reservation: @reservation, created: true }
    else
      render json: { error: 'There was an error, please try again!' }
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:doctor_id, :user_id, :date, :city)
  end
end
