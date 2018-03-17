Rails.application.routes.draw do

  devise_for :users
  resources :subscription, only: [:new]
  root controller: :home, action: :index
  post '/charges', controller: :subscription, action: :create
end
