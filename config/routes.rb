Rails.application.routes.draw do
  resource :session
  resources :posts, param: :slug
  get "/blog", to: "posts#index"
  root "posts#index"
end
