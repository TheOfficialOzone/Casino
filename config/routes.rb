Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "/lobby", to: "lobby#index"
  # Defines the root path route ("/")
  # root "posts#index"

  resource :session
  resources :passwords, param: :token

  resources :users
  root "lobby#index"

  resource :session

  get "/lobby", to: "lobby#index"
  post "/lobby/logout", to: "lobby#logout", as: :logout_lobby
  post "/lobby/horse_racing", to: "lobby#horse_racing", as: :horse_racing_lobby

  resource :session
  resources :passwords, param: :token

  resources :users
  root "lobby#index"
end
