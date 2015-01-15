Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :projects do
    resources :project_cycles, only: [:new, :create]
  end

  resources :project_cycles, only: [:show, :edit, :update, :destroy]
  resources :cycles
end
