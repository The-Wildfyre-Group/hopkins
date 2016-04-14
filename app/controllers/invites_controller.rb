class InvitesController < ApplicationController
  def create
    if User.find_by_email(params[:email])
      redirect_to :back, alert: "User already registered"
    else
      UserMailer.invite(params[:email], current_user).deliver
      redirect_to :back, notice: "Ivite sent"
    end
  end
end