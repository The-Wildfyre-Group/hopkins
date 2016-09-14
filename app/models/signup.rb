module Signup
  extend ActiveSupport::Concern

  included do
    has_secure_password
    before_create { GenerateToken.call(self, :authentication_token) }
    after_create :send_welcome_email
    validates_presence_of :password, :on => :create
    #validates :terms, acceptance: true

    %w[first_name last_name state].each { |column| validates column.to_sym, :presence => true, length: {minimum: 2, maximum: 25} }
    validates_presence_of :birthdate
    validates_presence_of :email
  end

  module ClassMethods;end # end Class Methods

  def send_welcome_email
    UserMailer.welcome(self).deliver
  end
end

