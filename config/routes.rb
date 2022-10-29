Rails.application.routes.draw do
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # camera
  resources :cameras, only: [:index, :show, :new, :create] do
    resources :offers, only: [:new, :create]
  end

  # user
  resources :users, only: [:new, :create]

  # offer
  resources :offers, only: [:index, :show, :edit, :update]
end
