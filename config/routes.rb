Rails.application.routes.draw do
  root 'main#index'

  resources :invites
  resources :password_resets

  resources :surveys, except: %w[new create show edit update destroy] do
    collection do
      get :status, as: :status
      get :services, as: :services
      get :behavior, as: :behavior
      get :social, as: :social
      get :closing, as: :closing
    end
  end

  resources :posts
  resources :partners

  resources :users, except: %w[index edit] do
    get :completed_surveys, on: :collection
  end
  resources :sessions, except: %w[index edit show update]
  resources :admin, except: %w[new create show edit update destroy] do
    collection do
      get :overview
      get :census
    end
  end

  namespace :admin do
   resources :users
   resources :partners
   resources :posts
  end

  resources :challenges do
    collection do
      post :set_order
    end
  end
  resources :shares, only: [:create, :show]
  resources :stats, only: [:index]
  get "share" => "shares#new"

  get "settings" => "users#settings", as: :settings
  get "results" => "users#results", as: :results
  get "login" => "sessions#new", as: :login
  get "participate" => "users#new", as: :participate
  get "consent" => "consent#consent", as: :consent
  get "consent/status" => "consent#status", as: :consent_status

  get "about/laveist" => "main#bio_laveist", as: :bio_laveist
  get "about/thorpe" => "main#bio_thorpe", as: :bio_thorpe
  get "about/mouton" => "main#bio_mouton", as: :bio_mouton
  get "about/neighbors" => "main#bio_neighbors", as: :bio_neighbors
  get "about/howard" => "main#bio_howard", as: :bio_howard
  get "about/gaskin" => "main#bio_gaskin", as: :bio_gaskin
  get "about/bruce" => "main#bio_bruce", as: :bio_bruce
  get "about/griffith" => "main#bio_griffith", as: :bio_griffith

  # main
  get "stories" => "main#stories", as: :stories
  get "about" => "main#about", as: :about
  # get "partners" => "main#partners", as: :partners
  get "share-with-us" => "main#share_your_story", as: :share_your_story
  get "contact" => "main#contact", as: :contact

  get "test" => "main#test", as: :test
end
