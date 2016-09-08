class Admin::UsersController < ApplicationController

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