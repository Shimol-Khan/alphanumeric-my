Rails.application.routes.draw do
  resources :questions do
    resources :answers
  end

  devise_for :users
  
  root to: 'static#index'

  get 'profile/:id', to: 'users#profile', as: :profile

  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
    get '/users/password', to: 'devise/passwords#new'
  end

end
