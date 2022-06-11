class Trip < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings

  def passengers_count
    self.bookings.map { |b| b.passengers if b.status == "Accepted" }.compact.sum
  end
end
