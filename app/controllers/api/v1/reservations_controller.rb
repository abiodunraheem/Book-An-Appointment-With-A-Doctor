class Api::V1::ReservationsController < ApplicationController
  def index
    @reservations = User.find(params[:user_id]).reservations
    @user = User.find(params[:user_id])
    @reservations = @user.reservations.includes(:doctor)
    render json: @reservations.as_json(include: :doctor)
  end

  def show
    @reservation = Reservation.find(params[:id])
    render json: @reservation
  end

  def create
    @user = User.find(params[:user_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = params[:user_id]
    @reservation.doctor_id = reservation_params[:doctor_id]
    if @reservation.save
      render json: @reservation
    else
      render json: { error: 'Unable to create reservation.' }, status: 400
    end
  end

  private

  def reservation_params
    params.permit(:date, :city, :doctor_id)
  end
end
