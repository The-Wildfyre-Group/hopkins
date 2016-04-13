Rails.application.routes.draw do
  root 'users#new'
  resources :surveys, except: %w[new create show edit update destroy] do
    collection do 
      get :status, as: :status
      get :services, as: :services
      get :behavior, as: :behavior
      get :psychosocial, as: :psychosocial
      get :closing, as: :closing
    end
  end
  
  resources :users, except: %w[index edit]
  resources :sessions, except: %w[index edit show update]
  resources :admin, except: %w[new create show edit update destroy] do
    collection do
      get :users
      get :overview
    end
  end
  
  
  get "settings" => "users#settings", as: :settings
  get "share" => "users#share", as: :share
  get "login" => "sessions#new", as: :login
  get "participate" => "users#new", as: :participate 
  
  get "test" => "main#test", as: :test
end
