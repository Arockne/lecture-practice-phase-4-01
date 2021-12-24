Rails.application.routes.draw do
  resources :events
  resources :groups, onnly: [:index, :show, :create, :update]
  resources :user_groups, only: [:index, :create, :destroy]
  resources :user_events, only: [:index, :create, :destroy, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
