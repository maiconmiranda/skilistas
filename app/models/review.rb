class Review < ApplicationRecord
  belongs_to :user
  belongs_to :profile
  validates :ratting, presence: true
end
