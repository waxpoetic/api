# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :articles
    resources :artists
    resources :events
    resources :images
    resources :releases
    resources :tracks
    resources :users

    root to: "articles#index"
  end

  apipie

  resources :events
  resources :articles
  resources :tracks
  resources :releases
  resources :artists
  resources :images

  root to: redirect('/docs')
end
