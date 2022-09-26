class Api::V1::DoctorsController < ApplicationController
  def index
    @doctors = Doctor.where(user_id: params[:user_id])
    render json: @doctors
  end

  def create
    @user = User.find(params[:user_id])
    @doctor = Doctor.new(doctor_params)
    @doctor.user_id = @user.id
    if @doctor.save
      render json: { status: 201, message: 'doctor created successfully!', content: { doctor: @doctor } }
    else
      render json: { error: 401, message: ' doctor cannot be processed !' }
    end
  end

  
  private

  def doctor_params
    params.permit(:name, :speciality, :bill, :image, :location, :email)
  end
end
