Rails.application.routes.draw do

  root to: 'games#index'

  devise_for :users

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
  end

end
