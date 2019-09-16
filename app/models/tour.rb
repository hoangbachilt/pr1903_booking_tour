class Tour < ApplicationRecord
  belongs_to :address
  has_many :comments
  has_many :ratings
end
