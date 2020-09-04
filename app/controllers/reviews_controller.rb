class ReviewsController < ApplicationController

  def index
    @has_user_signed = session[:user_id].present?
    if @has_user_signed
      @user = session[:user_id]
    end
    @search_term = params[:q]
    @reviews = Review.all
    if @search_term
      @reviews = Review.search_results(@search_term)
    end
  end

  def new 
    @has_user_signed = session[:user_id].present?
    if @has_user_signed
      @user = session[:user_id]
    end
    @review = Review.new
  end 

  def create 
    @review = Review.new(review_params)
    @review.user = User.find(session[:user_id])
    if (@review.save)
      redirect_to(review_path(@review))
    else
      render 'new'
    end 
  end 

  def edit 
    @has_user_signed = session[:user_id].present?
    if @has_user_signed
      @user = session[:user_id]
    end
    @review = Review.find(params[:id])
  end 

  def update
    @review = Review.find(params[:id])
    if (@review.update(review_params))
      redirect_to(review_path(@review))
    else
      render 'edit'
    end 
  end 

  def show 
    @has_user_signed = session[:user_id].present?
    if @has_user_signed
      @user = User.find(session[:user_id])
      @comment = Comment.new
      @is_bookmarked = @user.bookmarks.exists?(params[:id])
    end
    @review = Review.find(params[:id])
  end 

  private 

  def review_params 
    params.require(:review).permit(:title, :author, :image_url, :link, :body)
  end 

end
