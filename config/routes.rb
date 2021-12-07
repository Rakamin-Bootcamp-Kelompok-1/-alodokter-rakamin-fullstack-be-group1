Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
  get "/user/:id_user", to: "users#getUserData"
  patch "/user/update/:id_user", to: "users#updateUserData"
  post "/user/add", to: "users#create"

  resources :articles
  post "/articles", to: "articles#create"
  get "/articles", to: "articles#index"
  get "/articles", to: "articles#show"
  patch "articles/:id", to: "articles#update"
  delete "articles/:id", to: "articles#destroy"

  resource :doctors, only: [:create]
  get "/doctors", to: "doctors#index"
  get "doctor/:id", to: "doctors#show"
  post "/doctors/new", to: "doctors#create"
  patch "/doctor/:id", to: "doctors#update"
  delete "doctor/:id", to: "doctors#destroy"
end
