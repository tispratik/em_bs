module ActionMailer
  class Base
    def self.perform_delivery_smtp(smtp_settings, destinations)

      sender = "test@test.com"     
      mail = "this a test"

      smtp = Net::SMTP.new(smtp_settings[:address], smtp_settings[:port])
      smtp.enable_starttls_auto if smtp_settings[:enable_starttls_auto] && smtp.respond_to?(:enable_starttls_auto)

      smtp.start(smtp_settings[:domain], smtp_settings[:user_name], smtp_settings[:password],smtp_settings[:authentication]) do |smtp|
           smtp.sendmail(mail, sender, destinations)
      end
    end
  end
end