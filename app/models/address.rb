class Address < ApplicationRecord
  has_one_attached :picture
  has_many :tours
end
