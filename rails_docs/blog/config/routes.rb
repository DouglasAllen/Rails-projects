Rails.application.routes.draw do
  resources :comments

  resources :posts  

  resources :articles

  resources :posts do
    resources :comments
  end

  # get 'welcome/index' => 'welcome#index'
  get 'welcome/index', to: 'welcome#index'
  get "/welcome/new", to: 'welcome#new'
  get "/camping/readme", to: 'camping#readme'
end
