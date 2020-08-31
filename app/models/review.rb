class Review < ApplicationRecord

  validates :title, presence: true
  validates :title, length: { maximum: 210 }
  validates :body, presence: true
  validates :link, presence: true

  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :users

end
