require "application_system_test_case"

class HomeNavigationsTest < ApplicationSystemTestCase
  test 'visitor navigation is displayed' do 
    visit(root_path)
    assert page.has_content?('Log in / Register')
  end 

  test 'user navigation is displayed' do 
    visit(new_user_path)
    fill_in('Username', with: 'Username')
    fill_in('Email', with: 'user@user.ch')
    click_on('Log in')
    assert page.has_content?('Account')
  end 

  test 'visitor nav is working' do 
    visit(root_path)
    click_on('About')
    assert current_path.include?(about_path)
    click_on('Podcasts')
    assert current_path.include?(reviews_path)
    click_on('Log in / Register')
    assert current_path.include?(new_user_path)
  end 

  test 'user navigation is working' do 
    user = User.new username: 'Username',
                    email: 'user@user.ch'
    user.save!
    visit(new_user_path)
    fill_in('Username', with: 'Username')
    fill_in('Email', with: 'user@user.ch')
    click_on('Log in')
    click_on('About')
    assert current_path.include?(about_path)
    click_on('Podcasts')
    assert current_path.include?(reviews_path)
    click_on('Account')
    assert current_path.include?(user_path(user))
  end 
end
