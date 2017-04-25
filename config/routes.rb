Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :v1 do
    resources :sessions, only: [:create, :destroy]
    resources :prescriptions, only: [:create, :index, :show]
    resources :symptoms, only: [:create]
  end


end
