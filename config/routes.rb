Rails.application.routes.draw do
  devise_for :users

  # root to: 'pages#home'
  root to: 'bookings#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :trips do
    resources :bookings, only: [:new, :create, :show]
  end
  resources :bookings, except: [:new, :create, :show]
end
