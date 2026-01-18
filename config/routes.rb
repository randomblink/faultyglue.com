Rails.application.routes.draw do
  get "pages/home"
  root "pages#home"
  get "/about",   to: "pages#about",   as: :about
  get "/contact", to: "pages#contact", as: :contact

  get "pages/about"
  get "pages/contact"
  # Password reset (minimal)
  get  "/password/new", to: "passwords#new",    as: :new_password
  post "/password",     to: "passwords#create", as: :password
  resource :session
  resources :posts, param: :slug
  get "/blog", to: "posts#index"
  # root "posts#index"
end
