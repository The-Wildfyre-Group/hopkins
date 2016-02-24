class SessionsController < ApplicationController

  respond_to :html, :json

  def new
    current_user ? redirect_to(surveys_path) : nil
  end

  def create
    if user && user.authenticate(params[:password])
      set_cookies
      redirect_to surveys_path
    else
      render 'new'
    end
  end

  def destroy
    cookies.delete(:authentication_token)
    redirect_to root_url
  end
  
  private
  
  def user
    user = User.where(email: params[:email]).first
  end
  
  def set_cookies
    cookies.permanent[:authentication_token] = user.authentication_token
  end
  
  
end
