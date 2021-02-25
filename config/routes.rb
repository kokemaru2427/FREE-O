Rails.application.routes.draw do
  get 'rooms/show'
  devise_for :users
  root to: 'home#top'
  resources :users
  resources :events do
    resources :comments, only: :create
    resources :entries, only: [:index, :new, :create]
    resource :favorites, only: [:create, :destroy]
  end
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show]
end
