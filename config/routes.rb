Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => :registrations }

  root to: 'pages#home'
  # root to: 'trips#index'
  get "/my_trips", to: "trips#my_trips"
  put "/accept_booking/:id", to: "bookings#accept_booking", as: :accept_booking
  put "/reject_booking/:id", to: "bookings#reject_booking", as: :reject_booking
  get "/my_bookings", to: "bookings#my_bookings"
  get "/my_profile", to: "pages#my_profile", as: :my_profile

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :trips do
    resources :bookings, only: %i[new create show]
  end
  resources :bookings, except: %i[new create show]
end
