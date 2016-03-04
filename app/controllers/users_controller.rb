class UsersController < ApplicationController
  
  def index
    load_users
  end
  
  def new
    current_user ? redirect_to(surveys_path) : build_user
  end
  
  def create
    build_user
    login_user or render 'new'
  end
  
  def show
    load_user
  end

  def settings
    load_user
  end
  
  def update
    save_user or render 'settings'
  end
  
  def destroy
    
    
  end
  
  private
  
  def load_users
    @users ||= user_scope.to_a
  end
  
  def load_user
    current_user
  end
  
  def login_user
    if @user.save
      cookies.permanent[:authentication_token] = @user.authentication_token
      redirect_to surveys_path
    end
  end
  
  def build_user
    @user ||= User.new(user_params)
  end
  
  def save_user
    if current_user.update_attributes(user_params)
      redirect_to surveys_path
    end
  end
  
  def user_params
    user_params = params[:user]
    user_params ? user_params.permit(:first_name, :last_name, :email, :city, :state, :education, :terms, :password, :password_confirmation, :birthdate) : {}
  end
  
  def user_scope
    User.scoped
  end
  
end
