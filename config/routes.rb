Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :citas
  resources :tickets, only: :show
  get 'home/index'
  get 'zohoverify/verifyforzoho' 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
