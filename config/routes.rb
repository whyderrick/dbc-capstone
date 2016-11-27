Rails.application.routes.draw do

  get 'rooms/show'

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
  resources :sessions

  # API Routes
  namespace :api, constraints: -> (request){ request.format == 'json' } do
    resources :welcome, only: :index
    resources :groups
    resources :users, except: :index do
      resources :walks
    end
    resources :sessions
  end

  # Action Cable Routes
  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
