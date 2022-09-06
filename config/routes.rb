Rails.application.routes.draw do
  
  resources :films, except: :destroy
  get 'films/:id/destroy', 
      to: 'films#destroy', 
      as: 'destroy_film'

  post 'rates', 
      to: 'rates#create',
      as: 'create_rate'
  devise_for :users
end
