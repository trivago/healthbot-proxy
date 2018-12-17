Rails.application.routes.draw do
  resources :checks, only: [] do
    member do
      get :ping
    end
  end
end
