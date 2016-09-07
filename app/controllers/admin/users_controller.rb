class Admin::UsersController < ApplicationController
  
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
    
  end
  
end