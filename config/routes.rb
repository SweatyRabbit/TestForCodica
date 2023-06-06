# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'home#index'

  namespace :patients do
    resources :appointments, only: %i[index new create show]
    resources :doctors, only: %i[index]
  end

  namespace :doctors do
    resources :appointments, only: %i[index edit update]
  end
end
