class CommentsController < ApplicationController

  def create 
    @comment = Comment.new(comment_params)
    @comment.user = User.find(session[:user_id])
    @comment.review = Review.find(params[:review_id])
    @comment.save
    redirect_to(review_path(params[:review_id]))
  end 

  private 

  def comment_params 
    params.require(:comment).permit(:body)
  end 
end
