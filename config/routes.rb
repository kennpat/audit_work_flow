Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :projects do
    resources :cycles
  end

  resources :projects do
    resources :project_cycles
  end

  resources :cycles
end
