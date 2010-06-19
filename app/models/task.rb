class Task < ActiveRecord::Base

 belongs_to :project

 has_many :comments, :as => :commentable

 validates_presence_of :name
 validates_presence_of :assign_to

  def self.create_email_chain  task_users , subject
      Delayed::Job.enqueue MailingJob.new(task_users, subject) #, 0, 4.minutes.from_now
  end

  def send_to task, comment
      if task.is_a? Task
          assign_to = Task.find(task).assign_to.to_i
          user = User.find(assign_to)
          Delayed::Job.enqueue MailingJob.new(user, comment) #, 0, 4.minutes.from_now
       end
  end

end
