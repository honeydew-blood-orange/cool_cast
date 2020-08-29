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
end
