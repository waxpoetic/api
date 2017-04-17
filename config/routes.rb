# frozen_string_literal: true

Rails.application.routes.draw do
  apipie
  resources :articles
  resources :tracks
  resources :releases
  resources :artists

  root to: redirect('/docs')
end
