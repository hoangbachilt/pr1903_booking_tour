class Comment < ApplicationRecord
  belongs_to :tour
  belongs_to :user
  belongs_to :category
end
