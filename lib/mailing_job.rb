require 'net/smtp'
require 'smtp_tls'

class MailingJob < Struct.new(:user_mails, :content)


  def perform
        mailer_config = File.open("#{RAILS_ROOT}/config/email.yml")
        mailer_options = YAML.load(mailer_config)
       # if user_mails.size == 1
       #    ActionMailer::Base.perform_delivery_smtp mailer_options , user_mails[0].email, content
       # else
          user_mails.each do |u|
            mailing = User.find(u)
            ActionMailer::Base.perform_delivery_smtp mailer_options , mailing.email, content
          end
         end
     # end
end

