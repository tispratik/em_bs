class Wiki < ActiveRecord::Base
  
  has_many :comments, :as => :commentable

  belongs_to :project

   def self.create_email_chain   project_users , subject
     message = <<MESSAGE_END
From: Task <me@fromdomain.com>
To: Assign to <#{project_users[0].email}>
Subject: #{subject}

This is a test e-mail message.
MESSAGE_END

      Delayed::Job.enqueue MailingJob.new(project_users, subject) #, 0, 4.minutes.from_now
   end

   def send_to wiki, comment
      if wiki.is_a? Wiki        
          users = User.find(all)
          Delayed::Job.enqueue MailingJob.new(users, comment) #, 0, 4.minutes.from_now
       end
  end
end
