require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'a Comment can be saved' do 
    comment = Comment.new body: 'Comment body', 
                          user: User.new, 
                          review: Review.new
    comment.save!
    assert_equal(Comment.all.length, 1)
    assert_equal(Comment.first.body, 'Comment body')
  end 

  test 'a Comment cannot be saved without a User' do 
    comment = Comment.new body: 'Comment body', 
                          review: Review.new
    refute(comment.save)
  end 

  test 'a Comment cannot be saved without a Review' do 
    comment = Comment.new body: 'Comment body', 
                          user: User.new    
    refute(comment.save)
  end 
end
