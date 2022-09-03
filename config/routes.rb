Rails.application.routes.draw do
  
  resources :films, except: :destroy
  get 'films/:id/destroy', 
      to: 'films#destroy', 
      as: 'destroy_film'

  resources :rates, only: :create

  devise_for :users
end
