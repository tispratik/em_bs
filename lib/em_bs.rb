module EmBs

   @@obj = []
   @@sub = []
  def objects=param
    @@obj.push User.find(param[:assign_to].to_i)
    @@sub.push param[:name]
  end

  def user_objects
      @@obj
  end

  def title
    @@sub
  end

 @@messge = nil
 def message_str options = {}
   @@messge = <<MESSAGE_END
From: #{options[:title_from]} <#{options[:from]}>
To:  #{options[:title_to]} <#{options[:to]}>
Subject: #{options[:subject]}

#{options[:body]}
MESSAGE_END
 end

 def text_message
    @@messge
  end

  ActionView::Base.send :include , EmBs
end