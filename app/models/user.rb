class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :trips, through: :bookings
  has_many :bookings
  has_one_attached :profile_picture

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
