class Api::V1::ReservationsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @reservations = @user.reservations.includes(:doctor)
    render json: @reservations.as_json(include: :doctor)
  end

  def show
    @reservation = Reservation.find(params[:id])
    render json: @reservation = Reservation.all
  end

  def create
    @user = User.find(params[:user_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = @user.id
    @reservation.doctor_id = reservation_params[:doctor_id]
    if @reservation.save
      render json: @reservation
    else
      render json: {error: 'Error creating reservation'}
    end
  end

  private

  def reservation_params
    params.permit(:datetime, :city, :doctor_id, :user_id)
  end
end
