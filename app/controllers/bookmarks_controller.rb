class BookmarksController < ApplicationController

  def create 
    @review = Review.find(params[:review_id])
    @user = User.find(params[:user_id])
    @user.bookmarks << @review
    redirect_back(fallback_location: review_path(@review))
  end 

end
