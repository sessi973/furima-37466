Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :registrations, only: [:index,:new, :create, :edit, :update]
end
