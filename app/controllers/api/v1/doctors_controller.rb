class Api::V1::DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
    render json: @doctors
  end

  def show
    @doctor = Doctor.find(params[:id])
    render json: { doctor: @doctor }, status: :ok
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      render json: { status: 201, message: 'doctor created successfully!', content: { doctor: @doctor } }
    else
      render json: { error: 401, message: ' doctor cannot be processed !' }
    end
  end

  def delete
    @doctor = Doctor.find(params[:id])
    if @doctor.destroy!
      render json: { success: 'The car has been deleted successfully' }, status: :ok
    else
      render json: { error: 'There was an error, please try again!' }, status: :internal_server_error
    end
  end

  private

  def doctor_params
    params.permit(:name, :speciality, :bill, :avatar, :location, :email, :user_id)
  end
end
