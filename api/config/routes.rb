Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :checks, only: [] do
    member do
      get :ping
    end
  end
end
