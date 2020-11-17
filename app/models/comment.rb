class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :profile
  validates :description, presence: true
end
