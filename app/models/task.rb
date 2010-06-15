class Task < ActiveRecord::Base

 has_many :assignments
 has_many :projects, :through => :assignments


 has_many :user_tasks
 has_many :users, :through => :user_tasks
 

end
