Argyle::Application.routes.draw do
  resources :apps
  resources :sentinals
  root to: "pages#welcome"
end
