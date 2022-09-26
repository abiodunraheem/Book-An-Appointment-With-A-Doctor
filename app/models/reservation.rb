class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  validates :datetime, :city, :doctor, presence: true
  validates :bill , presence: true, numericality: { only_integer: true }
end
