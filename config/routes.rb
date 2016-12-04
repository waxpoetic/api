Rails.application.routes.draw do
  resources :subscribers
  resources :articles
  resources :tracks
  resources :releases
  resources :artists do
    resources :subscribers
  end

  root to: 'application#index'
end
