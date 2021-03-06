# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Authentication
  helper :all
  include EmBs
  protect_from_forgery

  before_filter :start
  
  def start
     Delayed::Job.enqueue MailReceiver.new(Comment.new) #, 0, 4.minutes.from_now
  end
end
