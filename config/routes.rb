Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # camera
  resources :cameras do
    resources :offers, only: [:new, :create]
  end

  # offer
  resources :offers, only: [:index, :show, :edit, :update]
end
