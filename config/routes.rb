Rails.application.routes.draw do
  root 'main#index'

  resources :invites
  resources :password_resets

  resources :surveys, except: %w[new create show edit update destroy] do
    collection do
      get :status, as: :status
      get :services, as: :services
      get :behavior, as: :behavior
      get :psychosocial, as: :psychosocial
      get :closing, as: :closing
    end
  end
  
  resources :posts

  resources :users, except: %w[index edit] do
    get :completed_surveys, on: :collection
  end
  resources :sessions, except: %w[index edit show update]
  resources :admin, except: %w[new create show edit update destroy] do
    collection do
      get :users
      get :overview
      get :census
    end
  end

  resources :challenges do
    collection do
      post :set_order
    end
  end
  resources :shares, only: [:create, :show]
  get "share" => "shares#new"

  get "settings" => "users#settings", as: :settings
  get "login" => "sessions#new", as: :login
  get "participate" => "users#new", as: :participate

  # main
  get "stories" => "main#stories", as: :stories
  get "about" => "main#about", as: :about
  get "partners" => "main#partners", as: :partners
  get "share-with-us" => "main#share_with_us", as: :share_with_us
  get "contact" => "main#contact", as: :contact

  get "test" => "main#test", as: :test
end
