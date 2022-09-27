class Api::V1::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user_id: params[:user_id])
    @user = User.all
    # @reservations = @user.reservation.includes(:doctor)
    render json: @reservations.as_json(include: :doctor)
  end

  def show;end

  def create
    @user = User.find(params[:user_id])
    @reservation = @user.reservations.new(reservation_params)
    @reservation.user_id = @user.id
    @reservation.doctor_id = reservation_params[:doctor_id]

    if @reservation.save
      render json: { reservation: @reservation, created: true }
    else
      render json: { error: 'There was an error, please try again!' }
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date, :city, :doctor)
  end
end
