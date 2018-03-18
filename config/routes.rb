Rails.application.routes.draw do
  root controller: :home, action: :index

  devise_for :users
  resources :subscription, only: [:new]
  resources :articles, only: [:new, :index, :create, :show]
  root controller: :home, action: :index
  post '/charges', controller: :subscription, action: :create
end
