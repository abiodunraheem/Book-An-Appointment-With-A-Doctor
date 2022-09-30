class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :doctors
  has_many :reservations, through: :doctors

  validates :username, :email, presence: true
end
