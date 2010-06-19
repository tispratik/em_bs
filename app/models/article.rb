class Article < ActiveRecord::Base

  has_many :comments, :as => :commentable
  belongs_to :project

  validates_presence_of :title



   def self.create_email_chain   project_users , subject
      Delayed::Job.enqueue MailingJob.new(project_users, subject) #, 0, 4.minutes.from_now
   end

   def send_to article, comment
      if article.is_a? Article
          users = User.find(all)
          Delayed::Job.enqueue MailingJob.new(users, comment) #, 0, 4.minutes.from_now
       end
  end

end
