ActionController::Routing::Routes.draw do |map|

  map.resources :users do |users|
    users.resources :comments, :member => {:quote => :get}
    users.resources :projects
  end

  

  map.resources :projects do |projects|
     projects.resources :tasks, :has_many => :comments, :member => { :deliver => :post }
     projects.resources :wikis, :has_many => :comments
     projects.resources :assets, :has_many => :comments, :member => { :deliver => :post }
     projects.resources :articles, :has_many => :comments
  end

  map.signup 'signup', :controller => 'users', :action => 'new'
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'
  map.login 'login', :controller => 'user_sessions', :action => 'new'
  map.resources :user_sessions

  #map.tasks_comment "/tasks/:id/comments", :controller => 'comments', :action => 'index'
  map.resources :users

  map.root :projects
end
