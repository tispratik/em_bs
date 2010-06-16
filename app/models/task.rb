class Task < ActiveRecord::Base

 has_many :assignments
 has_many :projects, :through => :assignments

 belongs_to :user

 has_many :user_tasks
 has_many :users, :through => :user_tasks
 
 has_many :comments, :as => :commentable
end
