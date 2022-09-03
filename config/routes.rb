Rails.application.routes.draw do
  get 'rates/create'

  devise_for :users
end
