Rails.application.routes.draw do
  # Password reset (minimal)
  get  "/password/new", to: "passwords#new",    as: :new_password
  post "/password",     to: "passwords#create", as: :password
  resource :session
  resources :posts, param: :slug
  get "/blog", to: "posts#index"
  root "posts#index"
end
