class CommentsController < ResourceController::Base
 before_filter :login_required
 before_filter :get_id
 
  index.before do
    @commentable = find_commentable
    @comments = @commentable.comments
  end
  

  create do   
    after do
       @commentable = find_commentable
       @comment = @commentable.comments.build(params[:comment])      
       if @comment.save
           Delayed::Job.enqueue MailingJob.new(User.find(Task.find(@commentable[:id]).user_id).id, @comment.description) #, 0, 4.minutes.from_now
       end
        flash[:notice] = "Successfully created comment & Mailing currently being delivered."
    end
      wants.html {redirect_to project_task_comments_path(@project, @commentable[:id])}
  end

  private

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end       
    end
    nil
  end

  def get_id
      @project = Project.find(params[:project_id])
  end

end
