class AssetsController < ResourceController::Base
  before_filter :get_id

     create do
       before do
           @asset.project = Project.find(@project)
       end
       after do
          Wiki.create_email_chain User.find(:all), params[:asset][:title]
       end
        flash "Successfully created! && Mailing currently being delivered."
        wants.html{redirect_to project_assets_path(@project)}
      end

     show.before do
       @comment = Comment.new
     end

     update do
      wants.html{redirect_to project_assets_path(@project)}
     end

      destroy do
        wants.html{redirect_to project_assets_path(@project)}
      end


     private
     def get_id
         @project = Project.find(params[:project_id])
     end


end
