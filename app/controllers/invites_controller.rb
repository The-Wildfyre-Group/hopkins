class InvitesController < ApplicationController


  def create
    InvitesService.new(params[:recipients], current_user).send_invites
    redirect_to :back, notice: "Invites sent"
  end
end