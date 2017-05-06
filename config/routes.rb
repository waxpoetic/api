# frozen_string_literal: true

Rails.application.routes.draw do
  apipie
  resources :articles
  resources :tracks
  resources :releases
  resources :artists
  resources :images

  root to: redirect('/docs')
end
