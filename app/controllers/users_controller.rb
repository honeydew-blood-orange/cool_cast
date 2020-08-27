class UsersController < ApplicationController

  def new
    @user = User.new
  end 

  def create 
    user = User.find_or_create_by(user_params)
    redirect_to(user_path(user))
  end 

  def show 
  end 

  private 

  def user_params 
    params.require(:user).permit(:username, :email)
  end 

end
