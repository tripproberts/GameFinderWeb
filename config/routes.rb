Rails.application.routes.draw do

  root to: 'games#index'

  devise_for :users

  namespace :api do
    mount_devise_token_auth_for 'User', at: 'users'
    get '/games' => 'games#index'
  end

end
