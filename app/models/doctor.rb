class Doctor < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations

  validates :name, :speciality, :location, :email, presence: true, length: { maximum: 255 }
  validates :bill, presence: true, numericality: { only_float: true }
  # has_one_attached :avatar
end
