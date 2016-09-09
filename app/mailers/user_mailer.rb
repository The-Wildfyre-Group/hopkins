class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def invite(email, current_user)
    @user = current_user
    mail to: email, subject: "Invite"
  end

  def completed_surveys(user)
    @user = user
    mail(to: @user.email, subject: 'Amazon giftcard for surveys')
  end
end
