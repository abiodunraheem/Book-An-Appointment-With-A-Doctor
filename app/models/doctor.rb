class Doctor < ApplicationRecord
  belongs_to :user

  validates :name, :speciality, :avatar, :bill, :location, :email, presence: true
end
