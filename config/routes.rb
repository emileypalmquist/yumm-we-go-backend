Rails.application.routes.draw do
  resources :categories
  resources :moods
  resources :restaurants
  resources :friends, only: [:index, :show, :create]
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index, :show, :update, :destroy]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get '/reauth', to: 'auth#re_auth'
      get '/recommendedFriends', to: 'users#recommended_friends'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
