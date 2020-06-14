Rails.application.routes.draw do
resources:articles
 root      "entries#welcome"
 get "signup", to: "users#new"
 post "users",  to: "users#create"
resources :users, except: [:new,:create,:show,:index,:destroy]
 delete "users.:id", to: "users#destroy"

post "users/:id/edit", to: "users#update"
get "users.:id", to: "users#show"
 get "users",  to: "users#index"
 get "login", to: "sessions#new"
  post "login", to: "sessions#create"
 delete "logout", to: "sessions#destroy"
  get "logout", to: "sessions#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :categories, except: [:destroy]
end
