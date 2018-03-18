Rails.application.routes.draw do
  root controller: :home, action: :index

  devise_for :users
  resources :subscription, only: [:new, :create]
  resources :articles, only: [:new, :index, :create, :show]
  root controller: :home, action: :index
end
