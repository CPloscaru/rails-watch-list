Rails.application.routes.draw do
  # get 'bookmarks/new'
  # get 'bookmarks/create'
  # get 'bookmarks/destroy'
  # get 'lists/new'
  # get 'lists/show'
  # get 'lists/create'
  # get 'lists/index'
  # get 'list/new'
  # get 'list/show'
  # get 'list/create'
  # get 'list/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "lists#index"
  # get "lists", to:"lists#index"
  # get "lists/:id", to: "lists#show"
  # get "lists/new", to: "lists#new"
  # post "lists", to:"lists#create"
  resources :lists, only: [:new, :create, :index, :show] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]
end
