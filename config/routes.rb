Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
  get "/user/:id_user", to: "users#getUserData"
  patch "/user/update/:id_user", to: "users#updateUserData"
  post "/user/add", to: "users#create"
end
