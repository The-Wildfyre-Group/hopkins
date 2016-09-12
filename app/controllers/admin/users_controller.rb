class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!
  # layout false
  
  def index
    @users = User.order(:id)
  end
  
  def new
    
  end
  
  def create
    
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end
  
end