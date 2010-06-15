class User < ActiveRecord::Base
  acts_as_authentic
  has_many :projects

 has_many :user_tasks
 has_many :tasks, :through => :user_tasks

 def deliver
    sleep 10 # placeholder for sending email
    update_attribute(:delivered_at, Time.now)
  end
end
