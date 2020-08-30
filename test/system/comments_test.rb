require "application_system_test_case"

class CommentsTest < ApplicationSystemTestCase
  test 'a Comment can be created with the comment form' do 
    review = Review.new title: 'A podcast title', 
                        author: 'Podcast author', 
                        image_url: 'https://is2-ssl.mzstatic.com/image/thumb/Podcasts113/v4/29/10/f0/2910f0bd-bea9-f4cc-d810-0c33a239af6c/mza_1582277213378144435.jpeg/1200x1200bb.jpg', 
                        link: 'https://www.google.ch/', 
                        body: 'My review body', 
                        user: User.new
    review.save!
    visit(new_user_path)
    fill_in('Username', with: 'Username')
    fill_in('Email', with: 'user@user.ch')
    click_on('Log in')
    visit(review_path(review))
    fill_in('Add a comment', with: 'A comment')
    click_on('Create Comment')
    assert_equal(Comment.all.length, 1)
    assert_equal(Comment.first.body, 'A comment')
  end 

  test 'after creating Comment redirect to review#show view' do 
    review = Review.new title: 'A podcast title', 
                        author: 'Podcast author', 
                        image_url: 'https://is2-ssl.mzstatic.com/image/thumb/Podcasts113/v4/29/10/f0/2910f0bd-bea9-f4cc-d810-0c33a239af6c/mza_1582277213378144435.jpeg/1200x1200bb.jpg', 
                        link: 'https://www.google.ch/', 
                        body: 'My review body', 
                        user: User.new
    review.save!
    visit(new_user_path)
    fill_in('Username', with: 'Username')
    fill_in('Email', with: 'user@user.ch')
    click_on('Log in')
    visit(review_path(review))
    fill_in('Add a comment', with: 'A comment')
    click_on('Create Comment')
    assert current_path.include?(review_path(review))
  end 
end
