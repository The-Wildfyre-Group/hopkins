class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def invite(email, current_user)
    @user = current_user
    mail to: email, subject: "Invite"
  end
end
