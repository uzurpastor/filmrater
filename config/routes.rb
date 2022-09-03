Rails.application.routes.draw do
  resources :films 
  resources :rates, only: :create

  devise_for :users
end
