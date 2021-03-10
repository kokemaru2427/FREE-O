Rails.application.routes.draw do
  get 'notifications/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root to: 'home#top'
  resources :users
  resources :events do
    resources :comments, only: :create
    resources :entries, only: [:index, :new, :create]
    resource :favorites, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :messages, only: :create
  resources :rooms, only: [:create, :show]
  resources :notifications
  resources :relationships, only: [:create, :destroy]
end
