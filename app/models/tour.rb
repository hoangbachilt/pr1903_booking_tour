class Tour < ApplicationRecord
  has_one_attached :picture
  belongs_to :address
  has_many :comments
  has_many :ratings
  has_many :booking_requests
  has_many :users, through: :booking_requests

  def self.search(name, page)
    if name	
      where('name LIKE ?', "%#{name}%").paginate(page: page)	
    else	
      paginate(page: page)	
    end	
  end
end
