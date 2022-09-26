class User < ApplicationRecord
  has_many :doctors

  validates :username, presence: true
end
