Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "movies#index"
  
  resources :movies, only: [:index, :edit, :update]
  
  get '/login' => 'sessions#new', as: 'login'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new', as: 'signup'
  post '/users' => 'users#create'
  
  namespace :api do
    namespace :v1 do
      resources :movies, only: [:create, :update]
    end
  end
end
