Rails.application.routes.draw do
  get 'brew/install'
  get 'brew/imagemagick'
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
