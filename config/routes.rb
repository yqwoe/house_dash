Rails.application.routes.draw do
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
