Rails.application.routes.draw do

  devise_for :users
  resources :subscription, only: [:new]
  root controller: :home, action: :index
  post '/charges', controller: :subscriptions, action: :create
end
