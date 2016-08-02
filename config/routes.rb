Rails.application.routes.draw do
  # resources :user

  # get "/users", to: "users#index", :as => 'user_url'
  # get "/users/:id", to: "users#show", :as => 'show_user'
  # post "/users", to: "users#create", :as => 'create_user'
  # delete "/users/:id", to: "users#destroy", :as => 'destroy_user'
  # patch "/users/:id", to: "users#update", :as => 'update_user'
  # get "/users/new", to: "users#new", :as => 'new_user'
  # get "/users/:id/edit", to: "users#edit", :as => 'edit_user'

  resources :users do
    resources :contacts, only: :index
    resources :comments, only: :index
  end

  resources :contacts do
    resources :comments, only: :index
  end

  resources "users", only: [:index,:show,:create,:update,:destroy,:new]
  resources "contacts", only: [:index,:show,:create,:update,:destroy,:new]
  resources "contact_shares", only: [:index, :create, :show, :destroy, :new]
  resources "comments", only: [:index, :create, :show, :destroy, :new]

end
