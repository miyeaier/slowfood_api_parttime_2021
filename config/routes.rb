Rails.application.routes.draw do
  namespace :api do
    
      resources :products, only: [:index, :show], constraints: { format: 'json' }
      resources :orders, only: %i[create]
  end
end