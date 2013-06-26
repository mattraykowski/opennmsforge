Opennmsforge::Application.routes.draw do
  resources :config_packs


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end