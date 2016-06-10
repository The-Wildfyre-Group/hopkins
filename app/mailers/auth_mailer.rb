class AuthMailer < ActionMailer::Base
  default from: "support@hopkins.com"

  def reset_password(user)
    @user = user
    mail to: @user.email, subject: "Reset password instructions"
  end
end
