class Api::V1::DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
    render json: @doctors
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      render json: { status: 201, message: 'doctor created successfully!', content: { doctor: @doctor } }
    else
      render json: { error: 401, message: ' doctor cannot be processed !' }
    end
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    if @doctor.destroy
      render json: { status: 201, message: 'doctor has been deleted successfully!', content: { doctor: @doctor } }
    else
      render json: { error: 401, message: ' Operation did not succeed!' }
    end
  end

  def doctors_list
    render json: Doctor.all
  end

  private

  def doctor_params
    params.permit(:user_id, :name, :speciality, :bill, :avatar, :location, :email)
  end
end
