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
end
