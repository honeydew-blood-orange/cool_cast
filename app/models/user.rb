class User < ApplicationRecord

  has_many :reviews
  has_many :comments 
  has_and_belongs_to_many :bookmarks, class_name: 'Review'
  
end
