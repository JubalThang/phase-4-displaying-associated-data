Rails.application.routes.draw do
  resources :reviews, only: [:index, :destroy, :show]
  resources :dog_houses, only: [:show, :index, :destroy]
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
