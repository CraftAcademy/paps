Rails.application.routes.draw do
  root controller: :articles, action: :index

  resources :articles, only: [:new, :index, :create, :show]
end
