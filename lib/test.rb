require 'net/smtp'
require 'smtp_tls'


  def deviver_mail

    message = <<MESSAGE_END
From: Private Person <me@fromdomain.com>
To: A Test User <test@todomain.com>
Subject: SMTP e-mail test

This is a test e-mail message.
MESSAGE_END

    Net::SMTP.start('smtp.gmail.com', 587, 'gmail.com',
                        'vijay.ror@gmail.com', '', :plain) do |smtp|
      smtp.send_message(message, 'from@address', 's.saru3@gmail.com')
    end
  end


    deviver_mail