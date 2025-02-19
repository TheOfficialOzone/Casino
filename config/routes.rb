Rails.application.routes.draw do
  #get "horse_race/index"

  get "horse_race/race"
  get "horse_race/betting"

  post 'horse_race/debug_skip_to_race', to: 'horse_race#debug_skip_to_race', as: 'debug_skip_to_race'
  post 'horse_race/submit_bet', to: 'horse_race#submit_bet', as: 'submit_bet'
  post 'horse_race/resolve_race', to: 'horse_race#resolve_race', as: 'resolve_race'

  #post 'horse_race/submit_bet', to: 'hores_race#submit_bet'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  resource :session
  resources :passwords, param: :token

  resources :users
end
