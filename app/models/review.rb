class Review < ApplicationRecord

  validates :title, presence: true
  validates :body, presence: true
  validates :link, presence: true
  validates :title, length: { maximum: 210 }

  belongs_to :user

end
