class BookingRequest < ApplicationRecord
  belongs_to :tour
  belongs_to :user

  scope :waiting, ->{where(status: nil)}
end
