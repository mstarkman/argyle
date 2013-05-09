Argyle::Application.routes.draw do
  resources :apps
  root to: "pages#welcome"
end
