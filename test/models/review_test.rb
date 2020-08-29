require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  test 'a Review can be saved' do
    review = Review.new title: 'A podcast title', 
                        author: 'Podcast author', 
                        image_url: 'https://is2-ssl.mzstatic.com/image/thumb/Podcasts113/v4/29/10/f0/2910f0bd-bea9-f4cc-d810-0c33a239af6c/mza_1582277213378144435.jpeg/1200x1200bb.jpg', 
                        link: 'https://www.google.ch/', 
                        body: 'My review body', 
                        user: User.new
    review.save!
    assert_equal(Review.all.length, 1)
    assert_equal(Review.first.title, 'A podcast title')
  end 

  test 'a Review cannot be saved without a User' do
    review = Review.new title: 'A podcast title', 
                        author: 'Podcast author', 
                        image_url: 'https://is2-ssl.mzstatic.com/image/thumb/Podcasts113/v4/29/10/f0/2910f0bd-bea9-f4cc-d810-0c33a239af6c/mza_1582277213378144435.jpeg/1200x1200bb.jpg', 
                        link: 'https://www.google.ch/', 
                        body: 'My review body'
    refute(review.save)
  end 
end
