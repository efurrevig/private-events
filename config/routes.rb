Rails.application.routes.draw do
  resources :private_invites

  root 'events#index'

  devise_for :users
  resources :users do
    resources :events
    resources :attendees
    resources :private_invites
  end

  resources :events do
    member do
      get 'cancel_rsvp'
    end
    resources :attendees
    resources :private_invites
  end


end
