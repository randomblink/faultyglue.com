# frozen_string_literal: true

Rails.application.routes.draw do
  # Home page = Blog index (oldest first will be handled in PostsController#index)
  root "posts#index"

  # Simple static pages
  get "/about",   to: "pages#about",   as: :about
  get "/contact", to: "pages#contact", as: :contact

  # Convenience route (optional)
  get "/blog", to: "posts#index", as: :blog

  # Authentication
  resource :session, only: %i[new create show edit update destroy]

  # Password reset (minimal placeholder)
  get  "/password/new", to: "passwords#new",    as: :new_password
  post "/password",     to: "passwords#create", as: :password

  # Posts (pretty URLs by slug)
  resources :posts, param: :slug
end
