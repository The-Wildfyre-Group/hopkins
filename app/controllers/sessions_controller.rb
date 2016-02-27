class SessionsController < ApplicationController

  respond_to :html, :json

  def new
    current_user ? redirect_to(surveys_path) : nil
  end

  def create
    create_session(user, params[:password]) or render 'new'
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
  
  def create_session(user, password)
    if user && user.authenticate(password)
      set_cookies
      redirect_to surveys_path
    end
  end
  
  
end
