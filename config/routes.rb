Rails.application.routes.draw do
  
  resources :films, except: :destroy
  get   'films/:id/destroy',  to: 'films#destroy',  as: 'destroy_film'
  post  'rates',              to: 'rates#create',   as: 'create_rate'

  devise_for :users, skip: [:registrations]

  devise_scope :user do
    get  "/users/sign_up", to: "devise/registrations#new",     as: :new_user_registration
    post "/users",         to: "devise/registrations#create",  as: :user_registration
  end

  root to: 'films#index'
end
