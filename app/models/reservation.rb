class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  validates :datetime, :city, :doctor, presence: true
end
