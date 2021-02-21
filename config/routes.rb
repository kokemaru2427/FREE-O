Rails.application.routes.draw do
  devise_for :users
  root to: 'home#top'
  resources :users
  resources :events do
    resources :comments, only: :create
  end
end
