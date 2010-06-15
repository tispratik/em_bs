class Assignment < ActiveRecord::Base
  belongs_to :project
  belongs_to :task

end
