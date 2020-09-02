class AboutController < ApplicationController
  def index
    @has_user_signed = session[:user_id].present?
    if @has_user_signed
      @user = session[:user_id]
    end
  end
end
