Rails.application.routes.draw do
  get 'search',to: 'search#index'
  root :to => 'home#index'
  resources :houses
  resources :positions
  resources :properties
  resources :village_prices
  resources :villages
  resources :area_prices do 
    collection do
      get :areas
    end
  end
  resources :city_prices
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
