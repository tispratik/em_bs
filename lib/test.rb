require 'net/smtp'
require 'smtp_tls'






  def deviver_mail
    Net::SMTP.start('smtp.gmail.com', 587, 'gmail.com',
                        'vijay.ror@gmail.com', 'babasaru', :plain) do |smtp|
      smtp.send_message("some text message", 'from@address', 'vijay.ror@gmail.com')
    end
  end


    deviver_mail