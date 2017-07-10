Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  
  resources :tickets
  resources :users
  resource :search, only: [:new, :show, :edit, :create]

  namespace :admin do
    resources :routes
    resources :tickets
    resources :welcome, only: [:index]

    resources :trains do
      resources :wagons, shallow: true
    end

    resources :railway_stations do 
      patch :update_position, on: :member
      patch :update_time, on: :member
    end
  end

  root 'searches#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
