# frozen_string_literal: true

Rails.application.routes.draw do
  apipie
  resources :articles
  resources :tracks
  resources :releases
  resources :artists do
    resources :articles
    resources :tracks
    resources :releases
  end

  root to: redirect('/docs')
end
