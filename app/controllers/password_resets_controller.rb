class PasswordResetsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user
      user.send_password_reset if user
      cookies.delete(:authentication_token)
      flash[:notice] = "Check you email for password reset instructions"
    else
      flash[:alert] = "Could not find user with such email"
    end
    respond_to do |format|
      format.js
      format.html{ redirect_to :back }
    end
  end
  
  def edit
    @user = User.find_by_reset_password_token!(params[:id])
  end
  
  def update
    @user = User.find_by_reset_password_token!(params[:id])
    #TODO move to service when have time
    #Auth::PasswordReset.call(params)
    if @user.reset_password_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, :alert => "Password has expired."
    elsif params[:user][:password].blank?
      flash.now[:alert] = "Password should not be blank"
      render :edit
    elsif params[:user][:password] != params[:user][:password_confirmation]
      flash.now[:alert] = "Password doesn't match confirmation"
      render :edit
    elsif @user.update_attributes(user_params) #TODO strong params
      flash[:success] = "Password has been reset."
      cookies.permanent[:authentication_token] = @user.authentication_token
      redirect_to surveys_path
    else
      render :edit
    end
  end
  
  protected
  
  def user_params
    params.require(:user).permit(:password, :password_digest)
  end
end


