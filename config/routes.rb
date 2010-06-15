ActionController::Routing::Routes.draw do |map|
  map.resources :tasks , :member => { :deliver => :post }

  map.resources :projects

  map.signup 'signup', :controller => 'users', :action => 'new'
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'
  map.login 'login', :controller => 'user_sessions', :action => 'new'
  map.resources :user_sessions

  map.resources :users

  map.root :projects
end
