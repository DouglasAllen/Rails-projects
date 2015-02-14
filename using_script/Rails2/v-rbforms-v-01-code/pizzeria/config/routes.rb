ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'home'
  
  map.signup 'signup', :controller => 'users', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'
  map.login 'login', :controller => 'sessions', :action => 'new'
  
  map.resources :sessions, :users, :pizzas, :house_pizzas, :my_pizzas
end
