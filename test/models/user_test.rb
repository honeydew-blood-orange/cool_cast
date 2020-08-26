require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'a user can be saved' do 
    user = User.new username: 'Name', 
                    email: 'name@user.ch'
    user.save!
    assert_equal(User.first.username, user.username)
    assert_equal(User.first.email, user.email)
    assert_equal(User.all.length, 1)
  end 
end
