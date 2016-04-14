class InvitesController < ApplicationController
  def create
    emails = params[:emails].split(/,\s?/)
    emails.select! do |email|
      unless User.find_by_email(email)
        UserMailer.invite(email, current_user).deliver
        true
      end
    end
    if emails.any?
      redirect_to :back, notice: "#{'Invite'.pluralize(emails.length)} sent"
    else
      redirect_to :back, alert: "No invites where sent"
    end
  end
end