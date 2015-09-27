Rails.application.routes.draw do
  root 'welcome#index'
  resources :rooms, only: [:index, :show]
  resources :users, only: [:new, :create]
  resources :messages
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :api do
    namespace :v1 do
      post 'add_message', to: 'message#add_message'
      # delete 'remove_song', to: 'search#remove_song'
    end
  end
end
