Rails.application.routes.draw do
  root 'restaurants#index'
  resources :restaurants do
    resources :reviews, only: [:index, :new, :create]
  end
  resources :reviews, only: [:show, :new]
  resources :categories
end
