# frozen_string_literal: true

Rails.application.routes.draw do
  resources :articles
  resources :tracks
  resources :releases

  resources :artists do
    resources :articles
    resources :tracks
    resources :releases
  end
end
