Rails.application.routes.draw do


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
  # When we're ready to deploy, we should consider hosting the api on a subdomain "api" instead and setting its path to root instead of using a separate domain. The code to do that is
  #``` namespace :api, defaults: { format: 'json' },
  #                    constraints: -> (request){ request.format == 'json' },
  #                    subdomain: 'api',
  #                    path: '/' do
  # Putting the do on a separate line from the last constraint will cause an error.

  namespace :api, defaults: { format: 'json' },
                  constraints: -> (request){ request.format == 'json' } do
    resources :welcome, only: :index
    resources :groups
    resources :users, except: :index do
      resources :walks
    end
    resources :sessions
  end

  # Action Cable Routes
  
  mount ActionCable.server => '/cable'
  resources :chatrooms, param: :slug 

  resources :walks do 
   resources :chatrooms, param: :slug 
  end 
  resources :messages

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
