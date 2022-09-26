require 'rails_helper'

RSpec.describe Doctor, type: :model do
  it "is not valid without a name" do
    doctor = Doctor.new(name: nil)
    expect(doctor).to_not be_valid
  end

  it "is not valid without a speciality" do
    doctor = Doctor.new(speciality: nil)
    expect(doctor).to_not be_valid
  end

  it "is not valid without a location" do
    doctor = Doctor.new(location: nil)
    expect(doctor).to_not be_valid
  end

  it "is not valid without an email" do
    doctor = Doctor.new(email: nil)
    expect(doctor).to_not be_valid
  end

  it "is not valid without a bill" do
    doctor = Doctor.new(bill: nil)
    expect(doctor).to_not be_valid
  end
end
