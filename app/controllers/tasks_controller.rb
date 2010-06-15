class TasksController < ResourceController::Base

  create do
    before do
        @task.projects << Project.find(params[:task][:id])
        @user = UserTask.new
        @selected_users =  params[:user][:id]
        @selected_users.each do |u|
          @task.users << User.find(u.to_i)
        end
    end
  end

  def deliver
   # Delayed::Job.enqueue(MailingJob.new(params[:id]))
    @task = Task.find_by_id(params[:id].to_i)
    @task_users = @task.users
    Delayed::Job.enqueue MailingJob.new(@task_users) #, 0, 4.minutes.from_now
    flash[:notice] = "Mailing currently being delivered."
    redirect_to tasks_url
  end

end
