Acs::Application.routes.draw do
  get "terrains/classify"
  patch "terrains/terrain_set"
  get "terrains/show"
  get "image_sets/create"
  get "image_sets/delete"
  get "image_sets/classify"
  get "image_sets/import"
  post "image_sets/import" => "image_sets#import_post"
  get "admin/index"
  get "admin/users"
  post "admin/start_server"

  get "game/events"

  devise_for :users

  # Scaffolds for editing privileged data structures
  resources :rooms
  resources :regions do
    get "edit_data", :on => :member  # TODO: Separate nested 'data' resource?
    put "update_data", :on => :member
  end
  resources :worlds

  root :to => 'players#index'

end
