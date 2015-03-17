Rails.application.routes.draw do
  resources :outings

  resources :sites

  resources :observations

  resources :eyepieces

  resources :telescopes

  resources :bodies

  devise_for :admins
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :bodies
  resources :telescopes
  #match 'users#show', as: :user_root
end
