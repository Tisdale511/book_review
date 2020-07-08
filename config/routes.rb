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
  get '/show_titles', to: "books#show_titles"
  post '/find_titles', to: "books#find_titles"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
