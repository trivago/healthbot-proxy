Rails.application.routes.draw do
  resources :checks, only: [] do
    member do
      get :ping
    end
  end

  # Active Admin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
