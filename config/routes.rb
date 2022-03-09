Rails.application.routes.draw do
  mount_devise_token_auth_for "User", at: "api/auth"
  namespace :api do
    resources :products, only: [:index, :show], constraints: { format: "json" }
    resources :orders, only: %i[create update]
  end
end
