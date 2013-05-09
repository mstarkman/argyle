Argyle::Application.routes.draw do
  get "apps/index"
  resources :apps
  root to: "pages#welcome"
end
