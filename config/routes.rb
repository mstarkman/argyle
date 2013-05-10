Argyle::Application.routes.draw do
  resources :apps
  resources :sentinals
  root to: "pages#welcome"

  # Sidekiq web admin
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
