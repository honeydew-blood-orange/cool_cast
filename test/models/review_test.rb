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

  test 'a Review cannot be saved without a title' do
    review = Review.new author: 'Podcast author', 
                        image_url: 'https://is2-ssl.mzstatic.com/image/thumb/Podcasts113/v4/29/10/f0/2910f0bd-bea9-f4cc-d810-0c33a239af6c/mza_1582277213378144435.jpeg/1200x1200bb.jpg', 
                        link: 'https://www.google.ch/', 
                        body: 'My review body', 
                        user: User.new
    refute(review.save)
  end 

  test 'a Review cannot be saved without a link' do
    review = Review.new title: 'A podcast title',
                        author: 'Podcast author', 
                        image_url: 'https://is2-ssl.mzstatic.com/image/thumb/Podcasts113/v4/29/10/f0/2910f0bd-bea9-f4cc-d810-0c33a239af6c/mza_1582277213378144435.jpeg/1200x1200bb.jpg', 
                        body: 'My review body', 
                        user: User.new
    refute(review.save)
  end 

  test 'a Review cannot be saved without a body' do
    review = Review.new title: 'A podcast title',
                        author: 'Podcast author', 
                        image_url: 'https://is2-ssl.mzstatic.com/image/thumb/Podcasts113/v4/29/10/f0/2910f0bd-bea9-f4cc-d810-0c33a239af6c/mza_1582277213378144435.jpeg/1200x1200bb.jpg', 
                        link: 'https://www.google.ch/', 
                        user: User.new
    refute(review.save)
  end 

  test 'a Review cannot be saved without a title too long' do
    review = Review.new title: 'Validations are used to ensure that only valid data is saved into your database. For example, it may be important to your application to ensure that every user provides a valid email address and mailing address. Model-level validations are the best way to ensure that only valid data is saved into your database. ',
                        author: 'Podcast author', 
                        image_url: 'https://is2-ssl.mzstatic.com/image/thumb/Podcasts113/v4/29/10/f0/2910f0bd-bea9-f4cc-d810-0c33a239af6c/mza_1582277213378144435.jpeg/1200x1200bb.jpg', 
                        link: 'https://www.google.ch/', 
                        body: 'My review body', 
                        user: User.new
    refute(review.save)
  end 

  test 'a Review can be updated' do
    review = Review.new title: 'A podcast title', 
                        author: 'Podcast author', 
                        image_url: 'https://is2-ssl.mzstatic.com/image/thumb/Podcasts113/v4/29/10/f0/2910f0bd-bea9-f4cc-d810-0c33a239af6c/mza_1582277213378144435.jpeg/1200x1200bb.jpg', 
                        link: 'https://www.google.ch/', 
                        body: 'My review body', 
                        user: User.new
    review.save!
    review.title = 'Updated title'
    review.author = 'Updated author'
    review.image_url = 'https://www.google.ch/images/branding/googlelogo/2x/googlelogo_color_272x92dp-updated.png'
    review.link = 'https://www.google.ch/updated'
    review.body = 'My review body updated'
    review.save
    assert_equal(review.title, 'Updated title')
    assert_equal(review.author, 'Updated author')
    assert_equal(review.image_url, 'https://www.google.ch/images/branding/googlelogo/2x/googlelogo_color_272x92dp-updated.png')
    assert_equal(review.link, 'https://www.google.ch/updated')
    assert_equal(review.body, 'My review body updated')
  end 

  test 'a Review can be bookmarked' do 
    user = User.new username: 'Name', 
                    email: 'name@user.ch'
    user.save!
    review = Review.new title: 'A podcast title', 
                        author: 'Podcast author', 
                        image_url: 'https://is2-ssl.mzstatic.com/image/thumb/Podcasts113/v4/29/10/f0/2910f0bd-bea9-f4cc-d810-0c33a239af6c/mza_1582277213378144435.jpeg/1200x1200bb.jpg', 
                        link: 'https://www.google.ch/', 
                        body: 'My review body', 
                        user: User.new
    review.save!
    user.bookmarks << review
    assert_equal(user.bookmarks.length, 1)
  end 
end
