Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: :json} do
    resources :benches, only: [:index, :show, :create]
    resources :reviews, only: [:create]
    resource :user, only: [:create]
    resource :session, only: [:create, :destroy, :show]
    resource :favorites, only: [:create, :destroy]
  end
  root to: 'static_pages#root'
end
