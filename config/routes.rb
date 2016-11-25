Rails.application.routes.draw do

 	root 'welcome#index'

 	# Session Routes
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # User Routes
  get '/signup' => 'users#new'

  # Channel Routes
  get '/groups/index' => 'groups#index'

 	resources :welcome, only: :index
  resources :users
  resources :groups
  resources :session

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
