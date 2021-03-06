Rails.application.routes.draw do
  # For details on the DSL available within this file, 
  # see http://guides.rubyonrails.org/routing.html
  resources :cats, only: [:index, :show, :new, :create, :edit, :update]
end

#   Prefix Verb URI Pattern                   Controller#Action
#    cats  GET   /cats(.:format)                 cats#index
#          POST  /cats(.:format)                 cats#create
# new_cat  GET   /cats/new(.:format)             cats#new
# edit_cat GET   /cats/:id/edit(.:format)        cats#edit
#     cat  GET   /cats/:id(.:format)             cats#show
#          PATCH /cats/:id(.:format)             cats#update
#          PUT   /cats/:id(.:format)             cats#update