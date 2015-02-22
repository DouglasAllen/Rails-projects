Nosy::Application.routes.draw do
  resources :statuses
  match '/help', :to => 'pages#help'
  root :to => 'statuses#index'
end
