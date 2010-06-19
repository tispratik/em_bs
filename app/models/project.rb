class Project < ActiveRecord::Base
  belongs_to :user
  has_one :task
  has_many :wikis
  has_many :articles
  has_many :assets
 
end
