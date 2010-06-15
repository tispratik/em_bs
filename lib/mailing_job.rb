require 'net/smtp'
require 'smtp_tls'


class MailingJob < Struct.new(:user_mails)

  def perform
        mailer_config = File.open("#{RAILS_ROOT}/config/email.yml")
        mailer_options = YAML.load(mailer_config)
        user_mails.each do |u|
        mailing = User.find(u)
         ActionMailer::Base.perform_delivery_smtp mailer_options , mailing.email
         mailing.deliver
       end
  end
end

