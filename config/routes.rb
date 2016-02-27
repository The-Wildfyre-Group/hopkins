Rails.application.routes.draw do
  root 'main#index'
  resources :surveys do
    collection do 
      get :status, as: :status
      get :services, as: :services
      get :behavior, as: :behavior
      get :psychosocial, as: :psychosocial
      get :closing, as: :closing
    end
  end
  
  resources :users, except: [:edit]
  resources :sessions
  resources :admin do
    collection do
      get :users
      get :overview
    end
  end
  
  
  get "settings" => "users#settings", as: :settings
  get "login" => "sessions#new", as: :login
  get "participate" => "users#new", as: :participate 
  
  get "test" => "main#test", as: :test
end
