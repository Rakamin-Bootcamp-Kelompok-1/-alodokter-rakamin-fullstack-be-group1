Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :users, only: [:create, :show, :index]
  post "/login", to: "users#login"
  get "/token_authenticate", to: "users#token_authenticate"
  post '/logout', to: 'users#destroy'
  get "/user/:id_user", to: "users#getUserData"
  patch "/user/update/:id_user", to: "users#updateUserData"
  post "/user/add", to: "users#create"
  get "/users", to: "users#getAllUsers"

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

  resource :patients, only: [:create]
<<<<<<< HEAD
  post "/patient/add", to: "patients#create"
=======
  get "/patients", to: "patients#index"
  get "patient/:id", to: "patients#show"
  post "/patients", to: "patients#create"
  patch "/patient/:id", to: "patients#update"
  delete "patient/:id", to: "patients#destroy"
>>>>>>> fb30642c3a014a71a2a184bed23b5dab13014f7b
end
