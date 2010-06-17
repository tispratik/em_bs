class TasksController < ResourceController::Base
  before_filter :login_required
  before_filter :get_id
  create do
    before do
        @task.projects << Project.find(@project)
        @user = UserTask.new
        @selected_users =  params[:user][:id]
        @selected_users.each do |u|
          @task.users << User.find(u.to_i)
        end
    end
      after do
          @task.update_attribute(:user, current_user)
      end
        wants.html{redirect_to project_tasks_path(@project)}
   end

  show.before do
    @comment = Comment.new
  end

   destroy do
     wants.html{redirect_to project_tasks_path(@project)}
   end

   

  def deliver
   # Delayed::Job.enqueue(MailingJob.new(params[:id]))
    @task = Task.find_by_id(params[:id].to_i)
    @task_users = @task.users
    Delayed::Job.enqueue MailingJob.new(@task_users, @task.description) #, 0, 4.minutes.from_now
    flash[:notice] = "Mailing currently being delivered."
    redirect_to  project_tasks_path(@project)
  end

  private
  def get_id
      @project = Project.find(params[:project_id])
  end


end
