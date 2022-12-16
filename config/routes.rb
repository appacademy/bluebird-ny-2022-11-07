Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # get '/chirps', to: "chirps#index"
  # get '/chirps/:id', to: "chirps#show"
  # post '/chirps', to: "chirps#create"
  # patch '/chirps/:id', to: "chirps#update"
  # put '/chirps/:id', to: "chirps#update"
  # delete '/chirp/:id', to: "chirps#destroy"

  # resources <controller>, <action_options>

  resources :chirps, only: [:index, :show, :create, :update, :destroy]

  # resources :chirps, except: [:new, :edit]

  resources :users

end
