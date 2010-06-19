class Asset < ActiveRecord::Base

   has_many :comments, :as => :commentable,  :dependent => :destroy
   belongs_to :project
   
   belongs_to :attachable, :polymorphic => true
   belongs_to :creator, :class_name => 'User', :foreign_key => "created_by"
   belongs_to :updator, :class_name => 'User', :foreign_key => "updated_by"

   has_attached_file :data,
       :path => ':rails_root/private/files/:id/:style/:basename.:extension',
       :url => lambda {|asset|
         path = "/:class/:id/:style"
         if attachable = asset.instance.attachable
           project = attachable.is_a?(Project) ? attachable : attachable.project
           path = "/projects/#{project.to_param}" + path
         end
         path
       },
       :styles => { :small => "150x150>" }

   validates_attachment_presence :data
   validates_attachment_size :data, :less_than => 10.megabytes
   validates_attachment_content_type :data, :content_type => [/^(?!application\/octet-stream)/]

   attr_protected :data_file_name, :data_content_type, :data_file_size, :orig_name
   #before_post_process :image?

   def self.create_email_chain   project_users , subject
      Delayed::Job.enqueue MailingJob.new(project_users, subject) #, 0, 4.minutes.from_now
   end

   def send_to asset, comment
      if asset.is_a? Asset
          users = User.find(all)
          Delayed::Job.enqueue MailingJob.new(users, comment) #, 0, 4.minutes.from_now
       end
  end
end
