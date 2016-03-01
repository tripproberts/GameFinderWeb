Rails.application.routes.draw do

  root to: 'games#index'

  devise_for :users

  namespace :user do
    resources :preferences, only: [:update]
  end

  resources :leagues, only: [:index] do
    member do
      get 'competitors'
    end
  end

  namespace :api do
    mount_devise_token_auth_for 'User', at: 'users'

    get '/games' => 'games#index'

    resources :leagues, only: [:index] do
      member do
        get 'competitors'
      end
    end

    namespace :user do
      put 'preferences' => 'preferences#update'
    end

  end

end
