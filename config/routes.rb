Rails.application.routes.draw do

  # get 'rooms/show' 

 	root 'welcome#index'

 	# Session Routes
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # User Routes
  get '/signup' => 'users#new'

  # Group Routes
  get '/groups/index' => 'groups#index'
  get '/groups/new' => 'groups#new'
  post '/groups/new' => 'groups#create'

 	resources :welcome, only: :index
  resources :groups
  resources :users do
  	resources :walks
  end 
  resources :session

  resources :chatrooms, param: :slug
  resources :messages

  # Action Cable Routes 
  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
