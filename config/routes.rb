Rails.application.routes.draw do
  root controller: :home, action: :index

  devise_for :users
  resources :subscription, only: [:new]
  resources :articles
  root controller: :home, action: :index
end
