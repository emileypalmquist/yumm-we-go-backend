Rails.application.routes.draw do
  resources :categories, only: [:index, :show, :create]
  resources :moods, only: [:index, :show, :create]
  resources :restaurants, only: [:index, :show, :create, :update]
  resources :friends, only: [:index, :show, :create, :destroy]
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index, :show, :update]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get '/reauth', to: 'auth#re_auth'
      get '/recommendedFriends', to: 'users#recommended_friends'
      get '/friends', to: 'users#friends'
      get '/find-friends', to: 'users#find_friends'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
