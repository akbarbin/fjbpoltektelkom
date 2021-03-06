ActionController::Routing::Routes.draw do |map|
  map.resources :searches

  map.root :controller => 'home' 

  map.signup 'signup', :controller => 'users', :action => 'new'
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'
  map.login 'login', :controller => 'user_sessions', :action => 'new'
  map.admin_login 'admin/login', :controller => 'admin/user_sessions', :action => 'new'
  
  map.resources :user_sessions
  map.resources :users
  map.resources :inboxs
  map.resources :posts, :comments
  map.resources :categories
  map.resources :offers
  map.resources :feedbacks
  map.resources :home, :collection => {:about   => :get,
                                       :contact     => :get,
                                       :list   => :get,
  }
  #admin
  map.admin "admin", :controller => "admin/home", :action => 'index'
  map.admin "admin", :controller => 'admin/users', :action => 'index'
  map.admin "admin", :controller => 'admin/posts', :action => 'index'
  map.admin "admin", :controller => 'admin/categories', :action => 'index'
  map.admin "admin", :controller => 'admin/feedbacks', :action => 'index'
  map.namespace :admin do |admin|
    admin.resources :home, :collection => {:about => :get,
                                           :contact => :get,
                                           :list => :get,
                                           :report => :get,
                                          }
    admin.resources :feedbacks                               
    admin.resources :users
    admin.resources :categories
    admin.resources :posts, :comments
    admin.resources :user_sessions
  end
end
