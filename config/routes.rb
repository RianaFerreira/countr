Rails.application.routes.draw do
  root 'countdown#index'

  resources :stays
end
