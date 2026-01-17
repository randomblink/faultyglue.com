Rails.application.routes.draw do
  resource :session
  resources :posts
  root "posts#index"
end
