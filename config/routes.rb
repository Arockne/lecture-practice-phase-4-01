Rails.application.routes.draw do
  resources :events
  resources :groups, onnly: [:index, :show, :create, :update]
  resources :user_groups, only: [:index, :create, :destroy]
  resources :user_events, only: [:index, :create, :destroy, :update]

  get '/me', to: 'users#show'
  post '/signup', to: 'users#create'

  delete '/logout', to: 'sessions#destroy'
  post '/login', to: 'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
