Argyle::Application.routes.draw do
  resources :apps do
    resources :app_sentinals, only: [:index, :create, :destroy]
  end

  resources :sentinals do
    collection do
      get 'change_form'
    end
  end

  root to: "pages#welcome"

  # Sidekiq web admin
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
