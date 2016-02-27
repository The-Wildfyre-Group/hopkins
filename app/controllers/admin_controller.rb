class AdminController < ApplicationController
  
  def overview
    
  end
  
  def users
    @users = User.order(:id)
  end
  
  def questions
    
  end
  
end
