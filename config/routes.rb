App::Application.routes.draw do
 
  get "stores/new"
  get "store/new"

  match '/', :to => "sessions#new"

  post "/users", :to => "users#create"
  post "/lists", :to => "lists#create"
  post "/sessions", :to => "sessions#create"
  post "/stores", :to => "stores#create"
  
  match "/users/:id/:cur_list", :to => "users#show", :as => :default_home
  match "/users/:id", :to => "users#show", :as => :home
  match "/signup",  :to => "users#new"
  match "/signin", :to => "sessions#new"
  match "/signout", :to => "sessions#destroy"
  match "/createlist", :to => "lists#new"
  match "/deletelist/:id", :to => "lists#destroy", :as => :delete_list

  match "/addtolist/:list_id/:store_id", :to => "lists#add", :as => :add_to_list
  match "/removefromlist/:list_id/:store_id", :to => "lists_stores#destroy", :as => :remove_from_list

  match "/addstore", :to => "stores#new"

  

  resources :sessions, only: [:new, :create, :destroy]
  
  #resources :users

 

 # match '/signup', :to => 'users#new'

end
