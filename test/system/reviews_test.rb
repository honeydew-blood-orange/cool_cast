require "application_system_test_case"

class ReviewsTest < ApplicationSystemTestCase
  test 'a Review can be saved' do 
    visit(new_user_path)
    fill_in('Username', with: 'Username')
    fill_in('Email', with: 'user@user.ch')
    click_on('Log in')
    visit(new_review_path)
    fill_in('Podcast title', with: 'A podcast title')
    fill_in('Podcast Author', with: 'An author')
    fill_in('Podcast image', with: 'https://www.google.ch/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png')
    fill_in('Podcast link', with: 'https://www.google.ch/')
    fill_in('Your review', with: 'My review body')
    click_on('Create Review')  
    assert_equal(Review.all.length, 1)
    assert_equal(Review.first.title, 'A podcast title')  
  end 

  test 'a Review is associated with a User' do 
    user = User.new email:'user@user.ch', 
                    username: 'Username'
    user.save!
    visit(new_user_path)
    fill_in('Username', with: 'Username')
    fill_in('Email', with: 'user@user.ch')
    click_on('Log in')
    visit(new_review_path)
    fill_in('Podcast title', with: 'A podcast title')
    fill_in('Podcast Author', with: 'An author')
    fill_in('Podcast image', with: 'https://www.google.ch/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png')
    fill_in('Podcast link', with: 'https://www.google.ch/')
    fill_in('Your review', with: 'My review body')
    click_on('Create Review')  
    assert_equal(Review.first.user, user)  
  end 

  test 'a Review saved redirect to the review#show view' do 
    visit(new_user_path)
    fill_in('Username', with: 'Username')
    fill_in('Email', with: 'user@user.ch')
    click_on('Log in')
    visit(new_review_path)
    fill_in('Podcast title', with: 'A podcast title')
    fill_in('Podcast Author', with: 'An author')
    fill_in('Podcast image', with: 'https://www.google.ch/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png')
    fill_in('Podcast link', with: 'https://www.google.ch/')
    fill_in('Your review', with: 'My review body')
    click_on('Create Review')  
    assert current_path.include?(review_path(Review.first))
  end 

  test 'error message if title, author and link are blank' do 
    visit(new_user_path)
    fill_in('Username', with: 'Username')
    fill_in('Email', with: 'user@user.ch')
    click_on('Log in')
    visit(new_review_path)
    fill_in('Podcast image', with: 'https://www.google.ch/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png')
    click_on('Create Review')  
    assert page.has_content?("Title can't be blank")
    assert page.has_content?("Body can't be blank")
    assert page.has_content?("Link can't be blank")
  end 

  test 'error message if title is too long' do 
    visit(new_user_path)
    fill_in('Username', with: 'Username')
    fill_in('Email', with: 'user@user.ch')
    click_on('Log in')
    visit(new_review_path)
    fill_in('Podcast title', with: 'Whitney Cummings is a stand up comedian, actress, writer, and producer. Check out her new podcast “Good For You” on Apple Podcasts & Spotify.  Annie Lederman is a stand up comedian. She is also the host of “MEANSPIRATION” podcast on All Things Comedy.')
    click_on('Create Review')  
    assert page.has_content?("Title is too long")
  end 

  test 'Review updated redirect to Review#show view' do 
    user = User.new username: 'Username', 
                    email: 'user@user.ch'
    user.save!
    review = Review.new title: 'A podcast title', 
                        author: 'Podcast author', 
                        image_url: 'https://is2-ssl.mzstatic.com/image/thumb/Podcasts113/v4/29/10/f0/2910f0bd-bea9-f4cc-d810-0c33a239af6c/mza_1582277213378144435.jpeg/1200x1200bb.jpg', 
                        link: 'https://www.google.ch/', 
                        body: 'My review body', 
                        user: user
    review.save!
    visit(new_user_path)
    fill_in('Username', with: 'Username')
    fill_in('Email', with: 'user@user.ch')
    click_on('Log in')
    visit(edit_review_path(review))
    fill_in('Podcast title', with: 'Updated title')
    click_on('Update Review') 
    assert current_path.include?(review_path(review))
  end 

  test 'a created Review can be updated' do 
    user = User.new username: 'Username', 
                    email: 'user@user.ch'
    user.save!
    review = Review.new title: 'A podcast title', 
                        author: 'Podcast author', 
                        image_url: 'https://is2-ssl.mzstatic.com/image/thumb/Podcasts113/v4/29/10/f0/2910f0bd-bea9-f4cc-d810-0c33a239af6c/mza_1582277213378144435.jpeg/1200x1200bb.jpg', 
                        link: 'https://www.google.ch/', 
                        body: 'My review body', 
                        user: user
    review.save!
    visit(new_user_path)
    fill_in('Username', with: 'Username')
    fill_in('Email', with: 'user@user.ch')
    click_on('Log in')
    visit(edit_review_path(review))
    fill_in('Podcast title', with: 'Updated title')
    fill_in('Podcast Author', with: 'Updated author')
    fill_in('Your review', with: 'My review body updated')
    click_on('Update Review') 
    assert page.has_content?('Updated title')
    assert page.has_content?('Updated author')
    assert page.has_content?('My review body updated')
  end 
end
