Blog::Application.routes.draw do
  #~ resources :posts do
    #~ resources :comments
  #~ end
  resources :products
  resources :articles do
    post :article
  end
  resources :main
  #~ root "main#_license"
  #~ root "main#credits"
  #~ root "main#Rails Routing from the Outside In — Ruby on Rails Guides"

  root "welcome#index"
  
end
