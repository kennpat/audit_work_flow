Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :projects do
    resources :project_cycles, only: [:new, :create]
    resources :assigned_users, only: [:new, :create]
  end

  resources :project_cycles, only: [:show, :edit, :update, :destroy] do
    resources :tasks, only: [:new, :create]
  end

  resources :tasks, only: [:show, :edit, :update, :destroy, :index]
  resources :cycles
  resources :assigned_users, only: [:show, :edit, :update, :destroy, :index]
end
