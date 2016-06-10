module Password
  extend ActiveSupport::Concern

  module ClassMethods;end # end Class Methods

  def encrypt_password
    self.password_digest = BCrypt::Password.create(password) if password.present?
  end

  def send_password_reset
    generate_token(:reset_password_token)
    self.reset_password_sent_at = Time.zone.now
    save
    AuthMailer.reset_password(self).deliver
  end

end

