Rails.application.routes.draw do
  resources :events, only: [:index, :show, :destroy]
  resources :groups, onnly: [:index, :show, :create, :update]
  resources :user_groups, only: [:create]
  resources :user_events, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
