require 'rails_helper'

RSpec.describe Reservation, type: :model do
  it "is not valid without a datetime" do
    reservation = Reservation.new(datetime: nil)
    expect(reservation).to_not be_valid
  end

  it "is not valid without a city" do
    reservation = Reservation.new(city: nil)
    expect(reservation).to_not be_valid
  end

  it "is not valid without a doctor" do
    reservation = Reservation.new(doctor: nil)
    expect(reservation).to_not be_valid
  end
end
