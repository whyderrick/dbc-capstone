Rails.application.routes.draw do

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/delete'

 	root 'welcome#index'

 	# Session Routes
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # User Routes
  get '/signup' => 'users#new'

  # Channel Routes
  get '/channels/index' => 'channels#index'

 	resources :welcome, only: :index
  resources :users
  resources :groups

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
