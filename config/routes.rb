Rails.application.routes.draw do
  root 'rooms#index'
  resources :rooms
  resources :users
  resources :messages

  namespace :api do
    namespace :v1 do
      post 'add_message', to: 'message#add_message'
      # delete 'remove_song', to: 'search#remove_song'
    end
  end
end
