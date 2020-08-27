require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test 'a user is created with form' do 
    visit(new_user_path)
    fill_in('Username', with: 'Username')
    fill_in('Email', with: 'user@user.ch')
    click_on('Log in')
    assert_equal(User.first.username, 'Username')
    assert_equal(User.first.email, 'user@user.ch')
  end 

  test 'user is redirected on the show view' do 
    user = User.new username: 'Username', 
                    email: 'user@user.ch' 
    user.save!
    visit(new_user_path)
    fill_in('Username', with: 'Username')
    fill_in('Email', with: 'user@user.ch')
    click_on('Log in')
    assert_equal(current_path, user_path(user))
  end 
end
