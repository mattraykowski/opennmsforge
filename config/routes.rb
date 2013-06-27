Opennmsforge::Application.routes.draw do
  match '/rate' => 'rater#create', :as => 'rate'

  resources :config_packs
  post '/config_packs/:id/comment' => "config_packs#comment"
  get '/popular' => "config_packs#most_popular"

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end