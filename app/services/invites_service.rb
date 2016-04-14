class InvitesService
  EMAIL_REGEXP = "^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$"

  def initialize(recipients, user)
    @recipients = recipients
    @recipients = @recipients.split(/,\s?/) if @recipients.is_a? String
    @user = user
  end

  def send_invites
    @recipients.each do |recipient|
      if Regexp.new(EMAIL_REGEXP, Regexp::IGNORECASE).match(recipient)
        UserMailer.invite(recipient, @user).deliver
      elsif recipient =~ /^\+?[\d\-]+$/
        Messanger.send_sms(recipient, sms_body)
      end
    end
  end

  def sms_body
    "You are invited by #{@user.try(:name)} to #{site_url}"
  end

  def site_url
    Rails.application.routes.url_helpers.root_url
  end
end