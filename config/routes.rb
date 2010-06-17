ActionController::Routing::Routes.draw do |map|
  map.resources :comments

  map.resources :wikis, :has_many => :comments
  #map.resources :tasks, :has_many => :comments, :member => { :deliver => :post }


  map.resources :projects do |projects|
     projects.resources :tasks, :has_many => :comments, :member => { :deliver => :post }
  end

  map.signup 'signup', :controller => 'users', :action => 'new'
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'
  map.login 'login', :controller => 'user_sessions', :action => 'new'
  map.resources :user_sessions

  #map.tasks_comment "/tasks/:id/comments", :controller => 'comments', :action => 'index'
  map.resources :users

  map.root :projects
end
