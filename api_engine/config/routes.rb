Rails.application.routes.draw do
  root to: 'visitors#index'
  
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :users do
  	resource :profile
  	resources :bids
  	resources :notifications
  end

  resources :catches do
    resources :catch_profiles
  	resources :bids
  end
end
