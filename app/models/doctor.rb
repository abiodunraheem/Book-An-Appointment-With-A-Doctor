class Doctor < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy

  validates :name, :speciality, :avatar, :location, :email, presence: true, length: { maximum: 255 }
  validates :bill, presence: true, numericality: { only_integer: true }
  has_one_attached :avatar
end
