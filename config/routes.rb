Rails.application.routes.draw do

  root 'events#index'

  devise_for :users
  resources :users do
    resources :events
    resources :attendees
  end

  resources :events do
    member do
      get 'cancel_rsvp'
    end
    resources :attendees
  end


end
