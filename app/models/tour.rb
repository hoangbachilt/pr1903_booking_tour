class Tour < ApplicationRecord
  belongs_to :address
  has_many :comments
  has_many :ratings
  
  def self.search(name, page)
    if name
      where('name LIKE ?', "%#{name}%").paginate(page: page)
    else
      paginate(page: page)
    end
  end
end
