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
           @commentable.send_to @commentable, params[:comment][:description]  #, 0, 4.minutes.from_now
       end
        flash[:notice] = "Successfully created comment & Mailing currently being delivered."
    end
      wants.html {redirect_to  [@project, @commentable, 'comments'] }
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
