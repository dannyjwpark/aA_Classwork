# Prefix Verb   URI Pattern                             Controller#Action
# users GET    /users(.:format)                        users#index
# POST   /users(.:format)                        users#create
# user GET    /users/:id(.:format)                    users#show
# PATCH  /users/:id(.:format)                    users#update
# PUT    /users/:id(.:format)                    users#update
# DELETE /users/:id(.:format)                    users#destroy

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :destroy, :index, :show, :update ]
  



  # get '/users', to: 'users#index' # as: 'user'
  # post '/users', to: 'users#create'
  # get '/users/new', to: 'users#new'
  # get '/users/:id', to: 'users#show'
  # patch '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'
end
