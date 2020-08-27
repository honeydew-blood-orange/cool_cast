class UsersController < ApplicationController

  def new
    @has_user_signed = session[:user_id].present?
    if @has_user_signed
      @user = session[:user_id]
    end
    @user = User.new
  end 

  def create 
    user = User.find_or_create_by(user_params)
    session[:user_id] = user.id
    redirect_to(user_path(user))
  end 

  def show 
    @has_user_signed = session[:user_id].present?
    if @has_user_signed
      @user = User.find(session[:user_id])
    end
  end 

  private 

  def user_params 
    params.require(:user).permit(:username, :email)
  end 

end
