class Trip < ApplicationRecord

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  geocoded_by :starting_point
  after_validation :geocode, if: :will_save_change_to_starting_point?

  def passengers_count
    self.bookings.map { |b| b.passengers if b.status == "Accepted" }.compact.sum
  end
end
