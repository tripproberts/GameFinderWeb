Rails.application.routes.draw do

  root to: 'user/games#index'

  devise_for :users

  namespace :user do
    put 'preferences' => 'preferences#update'
    get 'preferences/edit' => 'preferences#edit'
    resources :televisions, only: [:create]
    resources :channels, only: [:create]
    resources :games, only: [:index]
  end

  resources :leagues, only: [:index] do
    member do
      get 'competitors'
    end
  end

  namespace :api do
    mount_devise_token_auth_for 'User', at: 'users'

    resources :leagues, only: [:index] do
      member do
        get 'competitors'
      end
    end

    namespace :user do
      put 'preferences' => 'preferences#update'
      get 'preferences' => 'preferences#index'
      get 'preferences/:type' => 'preferences#index'
      resources :televisions, only: [:create, :index, :update]
      resources :channels, only: [:create, :index]
      resources :games, only: [:index]
    end

  end

end
