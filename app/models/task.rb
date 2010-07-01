require 'em_bs'
class Task < ActiveRecord::Base

 belongs_to :project

 has_many :comments, :as => :commentable

 validates_presence_of :name
 validates_presence_of :assign_to



  def self.create_email_chain  task_users , message
      Delayed::Job.enqueue MailingJob.new(task_users, message) #, 0, 4.minutes.from_now
  end

  def send_to task, comment
      user_objects = []
      if task.is_a? Task
          assign_to = Task.find(task).assign_to.to_i
          user = User.find(assign_to)
          user_objects.push user
           message_str :title_from =>"Task: #{Task.find(task).name if Task.find(task) != nil }", :from => "me@fromdomain.com", :title_to =>"#{Task.find(task).name if Task.find(task) != nil }", :to => user.email ,
                      :subject => "Comment" , :body => comment
          Delayed::Job.enqueue MailingJob.new(user_objects, text_message) #, 0, 4.minutes.from_now
       end
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

end
