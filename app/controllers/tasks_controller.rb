class TasksController < ResourceController::Base
  before_filter :login_required
  before_filter :get_id

  create do
    before do
        @task.project = Project.find(@project)
    end
    after do
       self.objects = params[:task]
       message_str :title_from =>"Task", :from => "me@fromdomain.com", :title_to =>"Assign To", :to => user_objects[0].email ,
                      :subject => title , :body => "This is a test comment message message."
       Task.create_email_chain user_objects, text_message
    end
     flash "Successfully created! && Mailing currently being delivered."
     wants.html{redirect_to project_tasks_path(@project)}
     #failure.wants.html { render :action =>'new' }
   end

  show.before do
    @comment = Comment.new
  end

  update do
      wants.html{redirect_to project_tasks_path(@project)}
  end

   destroy do
     wants.html{redirect_to project_tasks_path(@project)}
   end

   

  def deliver
   # Delayed::Job.enqueue(MailingJob.new(params[:id]))
    @task = Task.find_by_id(params[:id].to_i)
    @task_users = @task.users
    #Task.send_to @task_users, @task.description
    #Delayed::Job.enqueue MailingJob.new(@task_users, @task.description) #, 0, 4.minutes.from_now
    flash[:notice] = "Mailing currently being delivered."
    redirect_to  project_tasks_path(@project)
  end

  private
  def get_id
      @project = Project.find(params[:project_id])
  end


end
