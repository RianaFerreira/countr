Rails.application.routes.draw do
  root 'countdown#index'

  resources :stays
  resources :users do
    resources :entitlements
  end
end
