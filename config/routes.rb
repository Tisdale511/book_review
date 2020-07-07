Rails.application.routes.draw do
  #resources :book_tags 
  resources :tags
  resources :reviews
  resources :books
  resources :users

  get "/signup", to: "users#new", as: :signup
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
