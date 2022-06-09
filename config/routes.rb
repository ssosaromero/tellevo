Rails.application.routes.draw do
  devise_for :users

  # root to: 'pages#home'
  root to: 'trips#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :trips do
    resources :bookings, only: %i[new create show]
  end
  resources :bookings, except: %i[new create show]
end
