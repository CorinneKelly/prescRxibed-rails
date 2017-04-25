Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :v1 do
    resources :sessions, only: [:create, :destroy]
<<<<<<< HEAD
    resources :prescriptions, only: [:create, :index, :show]
    resources :symptoms, only: [:create]
=======
    resources :prescriptions, only: [:create]
    resources :events, only: [:index] do

    end
>>>>>>> 354a62f50abb36c9eaf939c66e2fad2034cf5d34
  end


end
