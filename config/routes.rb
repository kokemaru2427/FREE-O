Rails.application.routes.draw do
  devise_for :users
  root to: 'home#top'
  resources :users
  resources :events do
    resources :comments, only: :create
    resources :entries, only: [:index, :new, :create]
  end
end
