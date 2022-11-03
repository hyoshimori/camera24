Rails.application.routes.draw do

  devise_for :users
  root to: "cameras#index"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # camera
  resources :cameras, only: [:index, :show, :new, :create] do
    resources :offers, only: [:new, :create]
  end

  # offer
  resources :offers, only: [:index, :show, :edit, :update]
end
