Wifly::Application.routes.draw do
  get "maps/index"

  get "maps/show"

  get "maps/create"

  root to: "airports#welcome"

  get "/airports/search" => "airports#search"

  get '/not_found' => 'airports#not_found'

  resources :airports, except: [ :destroy ] #to kill the index path - , :index inside []s
  resources :maps

  # resources creates all of the following routes
  # get "/airports" => "airports#index"
  # get "/airports/new" => "airports#new", as: "new_airport"
  # get "/airports/:id" => "airports#show", as: "airport"
  # get "/airports/:id/edit" => "airports#edit", as: "edit_airport"
  # post "/airports" => "airports#create"
  # put "/airports/:id" => "airports#update"


  post "/airports/results" => "airports#results"


end
