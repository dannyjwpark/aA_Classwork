Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    # Your routes here
    resources :guests, only: [:index, :show] do 
      resources :gifts, only: [:index]
    end
    resources :gifts, only: [:index, :show];
    resources :parties, only: [:index, :show];
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root to: ''
end
