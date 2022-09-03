Rails.application.routes.draw do
  resources :rates, only: :create

  devise_for :users
end
