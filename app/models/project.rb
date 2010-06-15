class Project < ActiveRecord::Base
  belongs_to :user

  has_many :assignments
  has_many :tasks, :through => :assignments
end
