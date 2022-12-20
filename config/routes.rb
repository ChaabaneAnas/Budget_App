Rails.application.routes.draw do
  get 'entities/index'
  get 'entities/show'
  get 'entities/new'
  get 'entities/create'
  get 'groups/index'
  get 'groups/show'
  get 'groups/new'
  get 'groups/create'
  devise_for :users
  root "splash#index"
  resources :groups, only: [:index, :show, :new, :create]
  resources :entities, only: [:index, :show, :new, :create]
end
