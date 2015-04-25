Rails.application.routes.draw do
  resources :program_observations

  resources :program_bodies

  resources :programs

  resources :filters

  resources :location_types

  resources :outings do
    resources :observations, :only => [:new, :create, :edit]
  end

  resources :sites

  resources :observations

  resources :eyepieces

  resources :telescopes

  resources :bodies

  resources :catalogs

  devise_for :admins
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :bodies
  resources :telescopes
  #match 'users#show', as: :user_root
end
